// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class SmartText extends StatefulWidget {
  const SmartText({
    Key? key,
    this.width,
    this.height,
    required this.originalText,
    required this.textIndex,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.textAlign,
    this.maxLines,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String originalText;
  final int textIndex;
  final double? fontSize;
  final String? fontWeight;
  final Color? textColor;
  final String? textAlign;
  final int? maxLines;

  @override
  _SmartTextState createState() => _SmartTextState();
}

class _SmartTextState extends State<SmartText> {
  String _displayText = '';
  String _lastLanguage = '';

  @override
  void initState() {
    super.initState();
    _displayText = widget.originalText;
    _registerTextAndUpdate();
  }

  @override
  void didUpdateWidget(SmartText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.originalText != widget.originalText ||
        oldWidget.textIndex != widget.textIndex) {
      _registerTextAndUpdate();
    }
  }

  void _registerTextAndUpdate() {
    try {
      // Ensure the original texts list is large enough
      List<String> originalTexts =
          List<String>.from(FFAppState().originalTexts);

      // Extend list if needed
      while (originalTexts.length <= widget.textIndex) {
        originalTexts.add('');
      }

      // Set the text at the specified index
      originalTexts[widget.textIndex] = widget.originalText;

      // Update app state
      FFAppState().originalTexts = originalTexts;

      // Update display text
      _updateDisplayText();

      print(
          'Registered text at index ${widget.textIndex}: ${widget.originalText}');
    } catch (e) {
      print('Error registering text: $e');
      _displayText = widget.originalText;
    }
  }

  void _updateDisplayText() {
    try {
      String currentLang = FFAppState().currentLanguage;

      // Only update if language actually changed
      if (currentLang == _lastLanguage && _displayText.isNotEmpty) {
        return;
      }

      if (currentLang == 'fr') {
        // French - use original text
        _displayText = widget.originalText;
      } else {
        // Other languages - use translated text
        List<String> translatedTexts;

        if (currentLang == 'en') {
          translatedTexts = FFAppState().translatedTextsEn;
        } else if (currentLang == 'sg') {
          translatedTexts = FFAppState().translatedTextsSg;
        } else {
          _displayText = widget.originalText;
          _lastLanguage = currentLang;
          return;
        }

        // Get translated text or fallback to original
        if (widget.textIndex < translatedTexts.length &&
            translatedTexts[widget.textIndex].isNotEmpty) {
          _displayText = translatedTexts[widget.textIndex];
        } else {
          _displayText = widget.originalText;
        }
      }

      _lastLanguage = currentLang;

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error updating display text: $e');
      _displayText = widget.originalText;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if we need to update due to language change
    String currentLang = FFAppState().currentLanguage;
    if (currentLang != _lastLanguage) {
      _updateDisplayText();
    }

    // Build TextStyle from parameters
    TextStyle? textStyle;
    if (widget.fontSize != null ||
        widget.fontWeight != null ||
        widget.textColor != null) {
      textStyle = TextStyle(
        fontSize: widget.fontSize ?? 16,
        fontWeight: _parseFontWeight(widget.fontWeight),
        color: widget.textColor ?? Colors.black,
      );
    }

    // Parse text alignment
    TextAlign? alignment;
    if (widget.textAlign != null) {
      alignment = _parseTextAlign(widget.textAlign!);
    }

    return Container(
      width: widget.width,
      height: widget.height,
      child: Text(
        _displayText,
        style: textStyle,
        textAlign: alignment,
        maxLines: widget.maxLines,
        overflow: widget.maxLines != null ? TextOverflow.ellipsis : null,
      ),
    );
  }

  FontWeight _parseFontWeight(String? fontWeight) {
    if (fontWeight == null) return FontWeight.normal;

    switch (fontWeight.toLowerCase()) {
      case 'bold':
        return FontWeight.bold;
      case 'w100':
        return FontWeight.w100;
      case 'w200':
        return FontWeight.w200;
      case 'w300':
        return FontWeight.w300;
      case 'w400':
        return FontWeight.w400;
      case 'w500':
        return FontWeight.w500;
      case 'w600':
        return FontWeight.w600;
      case 'w700':
        return FontWeight.w700;
      case 'w800':
        return FontWeight.w800;
      case 'w900':
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }

  TextAlign _parseTextAlign(String textAlign) {
    switch (textAlign.toLowerCase()) {
      case 'left':
        return TextAlign.left;
      case 'right':
        return TextAlign.right;
      case 'center':
        return TextAlign.center;
      case 'justify':
        return TextAlign.justify;
      case 'start':
        return TextAlign.start;
      case 'end':
        return TextAlign.end;
      default:
        return TextAlign.left;
    }
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
