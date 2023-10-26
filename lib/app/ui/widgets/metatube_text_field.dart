import 'package:flutter/material.dart';
import 'package:metatube/app/utils/app_theme.dart';

class MetatubeTextField extends StatefulWidget {
  final int maxLength;
  final int? maxLines;
  final String hintText;
  final TextEditingController controller;

  const MetatubeTextField({
    super.key,
    required this.maxLength,
    this.maxLines,
    required this.hintText,
    required this.controller,
  });

  @override
  State<MetatubeTextField> createState() => _MetatubeTextFieldState();
}

class _MetatubeTextFieldState extends State<MetatubeTextField> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      controller: widget.controller,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      keyboardType: TextInputType.multiline,
      cursorColor: AppTheme.accent,
      style: AppTheme.inputStyle,
      decoration: InputDecoration(
        hintStyle: AppTheme.hintStyle,
        hintText: widget.hintText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.accent,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.medium,
          ),
        ),
        counterStyle: AppTheme.counterStyle,
      ),
    );
  }
}
