// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart' as actions; // Imports custom actions

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({
    Key? key,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.showTranslateButton,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? showTranslateButton;

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  final List<Map<String, String>> languages = [
    {'code': 'fr', 'name': 'Français', 'flag': '🇫🇷'},
    {'code': 'en', 'name': 'English', 'flag': '🇺🇸'},
    {'code': 'sg', 'name': 'Sango', 'flag': '🇨🇫'},
  ];

  Future<void> _handleLanguageChange(String newLanguage) async {
    if (newLanguage != FFAppState().currentLanguage) {
      print('Changing language to: $newLanguage');

      await actions.switchLanguage(newLanguage);

      // Force rebuild
      if (mounted) {
        setState(() {});
      }

      // Show success message
      if (mounted) {
        _showSuccessMessage(newLanguage);
      }
    }
  }

  void _showSuccessMessage(String language) {
    final messages = {
      'fr': 'Langue changée en français',
      'en': 'Language changed to English',
      'sg': 'Language changed to Sango',
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(messages[language] ?? 'Language changed'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.backgroundColor ?? Colors.white;
    final txtColor = widget.textColor ?? Colors.black87;
    final showBtn = widget.showTranslateButton ?? true;

    return Container(
      width: widget.width ?? 280,
      height: widget.height ?? 56,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: FFAppState().isTranslating
                ? _buildLoadingIndicator(txtColor)
                : _buildLanguageDropdown(bgColor, txtColor),
          ),
          if (showBtn) _buildTranslateButton(txtColor),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator(Color txtColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(txtColor),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Traduction en cours...',
              style: TextStyle(
                color: txtColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageDropdown(Color bgColor, Color txtColor) {
    String currentLang = FFAppState().currentLanguage.isEmpty
        ? 'fr'
        : FFAppState().currentLanguage;

    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          value: currentLang,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down, color: txtColor),
          style: TextStyle(
            color: txtColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          dropdownColor: bgColor,
          borderRadius: BorderRadius.circular(8),
          items: languages.map((language) {
            return DropdownMenuItem<String>(
              value: language['code'],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      language['flag']!,
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        language['name']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: txtColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          onChanged: FFAppState().isTranslating
              ? null
              : (String? newValue) async {
                  if (newValue != null) {
                    await _handleLanguageChange(newValue);
                  }
                },
        ),
      ),
    );
  }

  Widget _buildTranslateButton(Color txtColor) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: IconButton(
        icon: FFAppState().isTranslating
            ? SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(txtColor),
                ),
              )
            : Icon(
                Icons.translate_rounded,
                color: txtColor,
                size: 22,
              ),
        onPressed: FFAppState().isTranslating
            ? null
            : () => _showTranslationInfo(context),
        tooltip: 'Translation info',
      ),
    );
  }

  void _showTranslationInfo(BuildContext context) {
    final originalCount = FFAppState().originalTexts.length;
    final enCount = FFAppState().translatedTextsEn.length;
    final sgCount = FFAppState().translatedTextsSg.length;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Translation Info'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Registered texts: $originalCount'),
            Text('English translations: $enCount'),
            Text('Sango translations: $sgCount'),
            SizedBox(height: 16),
            Text('Current language: ${FFAppState().currentLanguage}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
