import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metatube/app/ui/widgets/metatube_icon_button.dart';
import 'package:metatube/app/utils/app_theme.dart';
import 'package:metatube/app/utils/snackbar_utils.dart';

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

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    SnackbarUtils.showSnackBar(context, Icons.content_copy, 'Copied text');
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
        suffixIcon: MetatubeIconButton(
          onPressed: widget.controller.text.isNotEmpty
              ? () => copyToClipboard(context, widget.controller.text)
              : null,
          icon: const Icon(Icons.content_copy_rounded),
          color: AppTheme.accent,
          disabledColor: AppTheme.medium,
        ),
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
