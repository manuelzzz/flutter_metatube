import 'package:flutter/material.dart';
import 'package:metatube/app/utils/app_theme.dart';

class SnackbarUtils {
  static void showSnackBar(
    BuildContext context,
    IconData icon,
    String message,
  ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              icon,
              color: AppTheme.accent,
            ),
            const VerticalDivider(width: 8),
            Text(message),
          ],
        ),
      ),
    );
  }
}
