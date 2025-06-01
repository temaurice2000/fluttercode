// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart' as actions;

Future switchLanguage(String targetLanguage) async {
  try {
    // Don't switch if already in target language or currently translating
    if (FFAppState().currentLanguage == targetLanguage ||
        FFAppState().isTranslating) {
      print('Already in $targetLanguage or currently translating');
      return;
    }

    // Set translating state
    FFAppState().isTranslating = true;
    print('Starting translation to $targetLanguage');

    // Update current language immediately
    FFAppState().currentLanguage = targetLanguage;

    // If target is French, no translation needed
    if (targetLanguage == 'fr') {
      FFAppState().isTranslating = false;
      print('Switched to French (no translation needed)');
      return;
    }

    // Get original texts
    List<String> originalTexts = List<String>.from(FFAppState().originalTexts);

    if (originalTexts.isEmpty) {
      FFAppState().isTranslating = false;
      print('No texts to translate');
      return;
    }

    // Get appropriate translated texts list
    List<String> translatedTexts;
    if (targetLanguage == 'en') {
      translatedTexts = List<String>.from(FFAppState().translatedTextsEn);
    } else if (targetLanguage == 'sg') {
      translatedTexts = List<String>.from(FFAppState().translatedTextsSg);
    } else {
      FFAppState().isTranslating = false;
      print('Unsupported language: $targetLanguage');
      return;
    }

    // Ensure translated list is same size as original
    while (translatedTexts.length < originalTexts.length) {
      translatedTexts.add('');
    }

    // Translate missing texts
    bool hasNewTranslations = false;
    int translatedCount = 0;

    for (int i = 0; i < originalTexts.length; i++) {
      if (originalTexts[i].isNotEmpty && translatedTexts[i].isEmpty) {
        try {
          String translated =
              await actions.translateText(originalTexts[i], targetLanguage);
          translatedTexts[i] = translated;
          hasNewTranslations = true;
          translatedCount++;

          print(
              'Translated ${translatedCount}/${originalTexts.length}: ${originalTexts[i]} -> $translated');

          // Small delay to avoid API rate limits
          await Future.delayed(Duration(milliseconds: 200));
        } catch (e) {
          print('Error translating "${originalTexts[i]}": $e');
          translatedTexts[i] = originalTexts[i]; // Fallback to original
        }
      }
    }

    // Update the appropriate app state list
    if (targetLanguage == 'en') {
      FFAppState().translatedTextsEn = translatedTexts;
    } else if (targetLanguage == 'sg') {
      FFAppState().translatedTextsSg = translatedTexts;
    }

    if (hasNewTranslations) {
      print(
          'Translation completed to $targetLanguage with $translatedCount new translations');
    } else {
      print('All texts already translated for $targetLanguage');
    }
  } catch (e) {
    print('Error during language switch: $e');
  } finally {
    // Always reset translating state
    FFAppState().isTranslating = false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
