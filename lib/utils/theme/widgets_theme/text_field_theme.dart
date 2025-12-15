import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class FkTextFormFieldTheme {
  FkTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    prefixIconColor: FkColors.darkGrey,
    suffixIconColor: FkColors.darkGrey,
    labelStyle: const TextStyle().copyWith(fontSize: FkSizes.fontSizeSm, color: FkColors.darkGrey, fontWeight: FontWeight.normal),
    hintStyle: const TextStyle().copyWith(fontSize: FkSizes.fontSizeSm, color: FkColors.darkGrey, fontWeight: FontWeight.normal),
    errorStyle: const TextStyle(height: 0, fontSize: 0),
    floatingLabelStyle: const TextStyle().copyWith(color: FkColors.black.withValues(alpha: 0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(FkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: FkColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(FkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: FkColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(FkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: FkColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(FkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: FkColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(FkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: FkColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    prefixIconColor: FkColors.darkGrey,
    suffixIconColor: FkColors.darkGrey,
    contentPadding: EdgeInsets.all(FkSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: FkSizes.fontSizeSm, color: FkColors.white, fontWeight: FontWeight.normal),
    hintStyle: const TextStyle().copyWith(fontSize: FkSizes.fontSizeSm, color: Colors.grey, fontWeight: FontWeight.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: FkColors.white.withValues(alpha: 0.8)),
    errorStyle: const TextStyle(height: 0, fontSize: 0),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(FkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: FkColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(FkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: FkColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(FkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: FkColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(FkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: FkColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(FkSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: FkColors.warning),
    ),
  );
}
