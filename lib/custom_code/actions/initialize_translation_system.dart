// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future initializeTranslationSystem() async {
  try {
    // Set French as default language
    FFAppState().currentLanguage = 'fr';

    // Initialize translation arrays if empty
    if (FFAppState().originalTexts.isEmpty) {
      FFAppState().originalTexts = [];
    }

    if (FFAppState().translatedTextsEn.isEmpty) {
      FFAppState().translatedTextsEn = [];
    }

    if (FFAppState().translatedTextsSg.isEmpty) {
      FFAppState().translatedTextsSg = [];
    }

    // Set not translating
    FFAppState().isTranslating = false;

    print('Translation system initialized with French as default');
  } catch (e) {
    print('Error initializing translation system: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
