import 'package:flutter/material.dart';
import 'package:metatube/app/utils/app_theme.dart';

class MetatubeElevatedButton extends StatefulWidget {
  final void Function()? onPressed;
  final Widget child;

  const MetatubeElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  State<MetatubeElevatedButton> createState() => _MetatubeElevatedButtonState();
}

class _MetatubeElevatedButtonState extends State<MetatubeElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.accent,
        foregroundColor: AppTheme.dark,
        disabledBackgroundColor: AppTheme.disableBackgroundColor,
        disabledForegroundColor: AppTheme.disableForegroundColor,
      ),
      child: widget.child,
    );
  }
}
