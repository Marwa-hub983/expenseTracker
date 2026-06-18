import 'package:expense_trackerapp/shared/constants/colors.dart';
import 'package:expense_trackerapp/shared/themes/font_palette.dart';
import 'package:flutter/material.dart';

void kSnackBars({
  required BuildContext context,
  required String content,
  bool isSuccess = false,
  Color? color,
  bool floating = false,
  String? actionLabel,
  VoidCallback? onAction,
}) {
  final bgColor = color ?? (isSuccess ? kGreenColor : Colors.red);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content, style: FontPalette.hW600S14),
      backgroundColor: bgColor,
      behavior:
          floating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      action: (actionLabel != null && onAction != null)
          ? SnackBarAction(
              label: actionLabel,
              onPressed: onAction,
              textColor: Colors.white,
            )
          : null,
    ),
  );
}