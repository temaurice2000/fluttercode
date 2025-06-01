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

// Global translation manager class
class AutoTranslationManager {
  static final AutoTranslationManager _instance =
      AutoTranslationManager._internal();
  factory AutoTranslationManager() => _instance;
  AutoTranslationManager._internal();

  Map<String, String> _originalTexts = {};
  Map<String, Map<String, String>> _translatedTexts = {};
  String _currentLanguage = 'fr';
  bool _isTranslating = false;
  final List<VoidCallback> _updateCallbacks = [];

  void addUpdateCallback(VoidCallback callback) {
    _updateCallbacks.add(callback);
  }

  void removeUpdateCallback(VoidCallback callback) {
    _updateCallbacks.remove(callback);
  }

  void _notifyUpdates() {
    for (var callback in _updateCallbacks) {
      try {
        callback();
      } catch (e) {
        print('Error in update callback: $e');
      }
    }
  }

  String get currentLanguage => _currentLanguage;
  bool get isTranslating => _isTranslating;

  String getTranslatedText(String originalText) {
    if (_currentLanguage == 'fr') {
      return originalText;
    }
    return _translatedTexts[_currentLanguage]?[originalText] ?? originalText;
  }

  void registerText(String originalText) {
    if (originalText.trim().isNotEmpty &&
        !_originalTexts.containsKey(originalText)) {
      _originalTexts[originalText] = originalText;
    }
  }

  Future<void> translateToLanguage(String targetLanguage) async {
    if (_isTranslating || targetLanguage == _currentLanguage) return;

    _isTranslating = true;
    _notifyUpdates();

    try {
      if (targetLanguage == 'fr') {
        _currentLanguage = targetLanguage;
        _notifyUpdates();
        return;
      }

      if (!_translatedTexts.containsKey(targetLanguage)) {
        _translatedTexts[targetLanguage] = {};
      }

      List<String> textsToTranslate = [];
      for (String originalText in _originalTexts.keys) {
        if (!_translatedTexts[targetLanguage]!.containsKey(originalText)) {
          textsToTranslate.add(originalText);
        }
      }

      if (textsToTranslate.isNotEmpty) {
        print(
            'Translating ${textsToTranslate.length} texts to $targetLanguage');

        for (String text in textsToTranslate) {
          try {
            String translated =
                await _translateSingleText(text, 'fr', targetLanguage);
            _translatedTexts[targetLanguage]![text] = translated;
            await _cacheTranslation(text, 'fr', targetLanguage, translated);
            await Future.delayed(Duration(milliseconds: 100));
          } catch (e) {
            print('Error translating "$text": $e');
            _translatedTexts[targetLanguage]![text] = text;
          }
        }
      }

      _currentLanguage = targetLanguage;
      FFAppState().currentLanguage = targetLanguage;
    } catch (e) {
      print('Translation error: $e');
    } finally {
      _isTranslating = false;
      _notifyUpdates();
    }
  }

  Future<String> _translateSingleText(
      String text, String sourceLanguage, String targetLanguage) async {
    String cachedTranslation =
        await _getCachedTranslation(text, sourceLanguage, targetLanguage);
    if (cachedTranslation.isNotEmpty) {
      return cachedTranslation;
    }

    final url = Uri.parse(
        'https://translation.googleapis.com/language/translate/v2?key=$GOOGLE_TRANSLATE_API_KEY');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: json.encode({
        'q': text,
        'source': sourceLanguage,
        'target': targetLanguage,
        'format': 'text',
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(utf8.decode(response.bodyBytes));
      return data['data']['translations'][0]['translatedText'];
    } else {
      throw Exception('Translation API error: ${response.statusCode}');
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
        final cacheTime = DateTime.parse(cacheEntry['timestamp']);

        if (DateTime.now().difference(cacheTime).inDays < 30) {
          return cacheEntry['translation'];
        } else {
          await prefs.remove(cacheKey);
        }
      }
    } catch (e) {
      print('Cache retrieval error: $e');
    }
    return '';
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
}

// Global instance
final AutoTranslationManager _globalManager = AutoTranslationManager();

/// HELPER FUNCTIONS THAT OTHER ACTIONS CAN CALL
Future translationManagerUtils() async {
  print('Translation manager utilities loaded');
}

// Helper function to register text
Future helperRegisterText(String text) async {
  _globalManager.registerText(text);
}

// Helper function to get translated text
String helperGetTranslatedText(String originalText) {
  return _globalManager.getTranslatedText(originalText);
}

// Helper function to get current language
String helperGetCurrentLanguage() {
  return _globalManager.currentLanguage;
}

// Helper function to check if translating
bool helperIsTranslating() {
  return _globalManager.isTranslating;
}

// Helper function to translate to language
Future helperTranslateToLanguage(String targetLanguage) async {
  await _globalManager.translateToLanguage(targetLanguage);
}

// Helper function to add update callback
void helperAddUpdateCallback(VoidCallback callback) {
  _globalManager.addUpdateCallback(callback);
}

// Helper function to remove update callback
void helperRemoveUpdateCallback(VoidCallback callback) {
  _globalManager.removeUpdateCallback(callback);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
