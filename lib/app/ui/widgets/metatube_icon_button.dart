import 'package:flutter/material.dart';
import 'package:metatube/app/utils/app_theme.dart';

class MetatubeIconButton extends StatefulWidget {
  final void Function()? onPressed;
  final Icon icon;
  final Color? color;
  final Color? disabledColor;

  const MetatubeIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.disabledColor,
  });

  @override
  State<MetatubeIconButton> createState() => _MetatubeIconButtonState();
}

class _MetatubeIconButtonState extends State<MetatubeIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      splashRadius: 20,
      splashColor: AppTheme.accent,
      color: widget.color ?? AppTheme.medium,
      disabledColor: widget.disabledColor,
      icon: widget.icon,
    );
  }
}
