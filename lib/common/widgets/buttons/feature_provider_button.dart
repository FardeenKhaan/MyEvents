
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class FkElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? height, width;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const FkElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false, // default
    this.height = 50,
    this.width,
    this.backgroundColor = FkColors.buttonPrimary,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor,
          splashFactory: NoSplash.splashFactory,
          padding: EdgeInsets.zero
        ),
        onPressed: isLoading ? null : onPressed,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isLoading
              ? const SizedBox(
                  key: ValueKey('loader'),
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
              : Text(
                  text,
                  key: const ValueKey('text'),
                  style:
                      textStyle ??
                      Theme.of(
                        context,
                      ).textTheme.headlineSmall!.copyWith(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
