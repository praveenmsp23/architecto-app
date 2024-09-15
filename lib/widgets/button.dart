import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonVariant { primary, secondary, destructive, outline, ghost, link }

enum ButtonSize { small, medium, large }

class Button extends StatelessWidget {
  final String text;
  final String? loadingText;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool isLoading;
  final bool isEnabled;
  final VoidCallback? onPressed;

  Button({
    required this.text,
    this.loadingText,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isEnabled = true,
    required this.onPressed,
  });

  Color _getBackgroundColor(BuildContext context) {
    if (!isEnabled) return Colors.grey;

    switch (variant) {
      case ButtonVariant.primary:
        return Colors.white;
      case ButtonVariant.secondary:
        return Colors.grey;
      case ButtonVariant.destructive:
        return Colors.red;
      case ButtonVariant.outline:
      case ButtonVariant.ghost:
      case ButtonVariant.link:
        return Colors.transparent;
    }
  }

  Color _getTextColor(BuildContext context) {
    if (!isEnabled) return Colors.white;

    switch (variant) {
      case ButtonVariant.primary:
        return Colors.black;
      case ButtonVariant.secondary:
        return Colors.white;
      case ButtonVariant.destructive:
        return Colors.white;
      case ButtonVariant.outline:
        return Colors.white;
      case ButtonVariant.ghost:
        return Colors.white;
      case ButtonVariant.link:
        return Colors.white;
    }
  }

  Color _getBorderColor() {
    if (!isEnabled) return Colors.grey;

    switch (variant) {
      case ButtonVariant.outline:
        return Colors.white;
      case ButtonVariant.primary:
      case ButtonVariant.secondary:
      case ButtonVariant.destructive:
      case ButtonVariant.ghost:
      case ButtonVariant.link:
        return Colors.transparent;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case ButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      case ButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 20, vertical: 16);
    }
  }

  double _getFontSize() {
    switch (size) {
      case ButtonSize.small:
        return 12;
      case ButtonSize.medium:
        return 16;
      case ButtonSize.large:
        return 18;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled && !isLoading ? onPressed : null,
      child: Container(
        padding: _getPadding(),
        decoration: BoxDecoration(
          color: _getBackgroundColor(context),
          borderRadius: BorderRadius.circular(8),
          border: variant == ButtonVariant.outline
              ? Border.all(color: _getBorderColor(), width: 2)
              : null,
        ),
        child: Center(
          child: isLoading
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CupertinoActivityIndicator(),
                    SizedBox(width: 8),
                    Text(
                      loadingText ?? text,
                      style: TextStyle(
                        color: _getTextColor(context),
                        fontSize: _getFontSize(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: _getTextColor(context),
                    fontSize: _getFontSize(),
                    fontWeight: FontWeight.bold,
                    decoration: variant == ButtonVariant.link
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                ),
        ),
      ),
    );
  }
}
