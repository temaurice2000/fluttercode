// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Your Google Translate API key
const String GOOGLE_TRANSLATE_API_KEY =
    'AIzaSyCqtMQ7izEBpdMX-wnaHL01KrIEZUO1yHQ';

Future<String> translateText(String text, String targetLanguage) async {
  try {
    // Skip translation if target is French (source language)
    if (targetLanguage == 'fr' || text.trim().isEmpty) {
      return text;
    }

    // Check cache first
    String cachedTranslation =
        await _getCachedTranslation(text, 'fr', targetLanguage);

    if (cachedTranslation.isNotEmpty) {
      print(
          'Using cached translation for: ${text.substring(0, text.length > 30 ? 30 : text.length)}...');
      return cachedTranslation;
    }

    // Call Google Translate API
    final url = Uri.parse(
        'https://translation.googleapis.com/language/translate/v2?key=$GOOGLE_TRANSLATE_API_KEY');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: json.encode({
        'q': text,
        'source': 'fr',
        'target': targetLanguage,
        'format': 'text',
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(utf8.decode(response.bodyBytes));
      String translatedText = data['data']['translations'][0]['translatedText'];

      // Cache the translation
      await _cacheTranslation(text, 'fr', targetLanguage, translatedText);

      print(
          'API translation completed for: ${text.substring(0, text.length > 30 ? 30 : text.length)}...');
      return translatedText;
    } else {
      print('Translation API error: ${response.statusCode}');
      return text; // Return original text if translation fails
    }
  } catch (e) {
    print('Translation exception: $e');
    return text; // Return original text if error occurs
  }
}

Future<String> _getCachedTranslation(
    String text, String sourceLanguage, String targetLanguage) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final cacheKey =
        'translation_${text.hashCode.abs()}_${sourceLanguage}_$targetLanguage';

    final cachedData = prefs.getString(cacheKey);
    if (cachedData != null) {
      final cacheEntry = json.decode(cachedData);

      // Check if cache entry is still valid (30 days)
      final cacheTime = DateTime.parse(cacheEntry['timestamp']);
      final now = DateTime.now();

      if (now.difference(cacheTime).inDays < 30) {
        return cacheEntry['translation'];
      } else {
        // Cache expired, remove it
        await prefs.remove(cacheKey);
      }
    }

    return '';
  } catch (e) {
    print('Cache retrieval error: $e');
    return '';
  }
}

Future<void> _cacheTranslation(String originalText, String sourceLanguage,
    String targetLanguage, String translatedText) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final cacheKey =
        'translation_${originalText.hashCode.abs()}_${sourceLanguage}_$targetLanguage';

    final cacheEntry = {
      'translation': translatedText,
      'timestamp': DateTime.now().toIso8601String(),
      'source': sourceLanguage,
      'target': targetLanguage,
    };

    await prefs.setString(cacheKey, json.encode(cacheEntry));
  } catch (e) {
    print('Cache storage error: $e');
  }
}
