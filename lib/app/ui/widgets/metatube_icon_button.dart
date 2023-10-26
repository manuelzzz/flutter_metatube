import 'package:flutter/material.dart';
import 'package:metatube/app/utils/app_theme.dart';

class MetatubeIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final Icon icon;

  const MetatubeIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashRadius: 20,
      splashColor: AppTheme.accent,
      color: AppTheme.medium,
      icon: icon,
    );
  }
}
