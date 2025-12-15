import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';


class FkElevatedButtonTheme {
  FkElevatedButtonTheme._();



  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: FkColors.light,
      backgroundColor: FkColors.primary,
      disabledForegroundColor: FkColors.darkGrey,
      disabledBackgroundColor: FkColors.buttonDisabled,
      side: const BorderSide(color: FkColors.light),
      padding: const EdgeInsets.symmetric(vertical: FkSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: FkColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FkSizes.buttonRadius)),
    ),
  );


  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: FkColors.light,
      backgroundColor: FkColors.primary,
      disabledForegroundColor: FkColors.darkGrey,
      disabledBackgroundColor: FkColors.darkerGrey,
      side: const BorderSide(color: FkColors.primary),
      padding: const EdgeInsets.symmetric(vertical: FkSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: FkColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FkSizes.buttonRadius)),
    ),
  );
}
