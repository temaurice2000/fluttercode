import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _currentLanguage = 'fr';
  String get currentLanguage => _currentLanguage;
  set currentLanguage(String value) {
    _currentLanguage = value;
  }

  List<String> _originalTexts = [];
  List<String> get originalTexts => _originalTexts;
  set originalTexts(List<String> value) {
    _originalTexts = value;
  }

  void addToOriginalTexts(String value) {
    originalTexts.add(value);
  }

  void removeFromOriginalTexts(String value) {
    originalTexts.remove(value);
  }

  void removeAtIndexFromOriginalTexts(int index) {
    originalTexts.removeAt(index);
  }

  void updateOriginalTextsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    originalTexts[index] = updateFn(_originalTexts[index]);
  }

  void insertAtIndexInOriginalTexts(int index, String value) {
    originalTexts.insert(index, value);
  }

  List<String> _translatedTextsEn = [];
  List<String> get translatedTextsEn => _translatedTextsEn;
  set translatedTextsEn(List<String> value) {
    _translatedTextsEn = value;
  }

  void addToTranslatedTextsEn(String value) {
    translatedTextsEn.add(value);
  }

  void removeFromTranslatedTextsEn(String value) {
    translatedTextsEn.remove(value);
  }

  void removeAtIndexFromTranslatedTextsEn(int index) {
    translatedTextsEn.removeAt(index);
  }

  void updateTranslatedTextsEnAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    translatedTextsEn[index] = updateFn(_translatedTextsEn[index]);
  }

  void insertAtIndexInTranslatedTextsEn(int index, String value) {
    translatedTextsEn.insert(index, value);
  }

  List<String> _translatedTextsSg = [];
  List<String> get translatedTextsSg => _translatedTextsSg;
  set translatedTextsSg(List<String> value) {
    _translatedTextsSg = value;
  }

  void addToTranslatedTextsSg(String value) {
    translatedTextsSg.add(value);
  }

  void removeFromTranslatedTextsSg(String value) {
    translatedTextsSg.remove(value);
  }

  void removeAtIndexFromTranslatedTextsSg(int index) {
    translatedTextsSg.removeAt(index);
  }

  void updateTranslatedTextsSgAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    translatedTextsSg[index] = updateFn(_translatedTextsSg[index]);
  }

  void insertAtIndexInTranslatedTextsSg(int index, String value) {
    translatedTextsSg.insert(index, value);
  }

  bool _isTranslating = false;
  bool get isTranslating => _isTranslating;
  set isTranslating(bool value) {
    _isTranslating = value;
  }
}
