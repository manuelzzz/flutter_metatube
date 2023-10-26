import 'package:flutter/material.dart';
import 'package:metatube/app/utils/app_theme.dart';

class MetatubeElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;

  const MetatubeElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.accent,
        foregroundColor: AppTheme.dark,
        disabledBackgroundColor: AppTheme.disableBackgroundColor,
        disabledForegroundColor: AppTheme.disableForegroundColor,
      ),
      child: child,
    );
  }
}
