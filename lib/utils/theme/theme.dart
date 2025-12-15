import 'package:flutter/material.dart';
import 'package:my_events/utils/theme/widgets_theme/appbar_theme.dart';
import 'package:my_events/utils/theme/widgets_theme/bottom_sheet_theme.dart';
import 'package:my_events/utils/theme/widgets_theme/checkbox_theme.dart';
import 'package:my_events/utils/theme/widgets_theme/chip_theme.dart';
import 'package:my_events/utils/theme/widgets_theme/elevated_button_theme.dart';
import 'package:my_events/utils/theme/widgets_theme/outlined_button_theme.dart';
import 'package:my_events/utils/theme/widgets_theme/text_field_theme.dart';
import 'package:my_events/utils/theme/widgets_theme/text_theme.dart';
import '../constants/colors.dart';

class FkAppTheme {
  // private constructor
  FkAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Jost',
    brightness: Brightness.light,
    primaryColor: FkColors.primary,
    disabledColor: FkColors.grey,
    textTheme: FkTextTheme.lightTextTheme,
    chipTheme: FkChipTheme.lightChipTheme,
    scaffoldBackgroundColor: FkColors.appColor,
    appBarTheme: FkAppBarTheme.lightAppBarTheme,
    checkboxTheme: FkCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: FkBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: FkElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: FkOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: FkTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    brightness: Brightness.dark,
    primaryColor: FkColors.primary,
    disabledColor: FkColors.grey,
    textTheme: FkTextTheme.darkTextTheme,
    chipTheme: FkChipTheme.darkChipTheme,
    scaffoldBackgroundColor: FkColors.black,
    appBarTheme: FkAppBarTheme.darkAppBarTheme,
    checkboxTheme: FkCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: FkBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: FkElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: FkOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: FkTextFormFieldTheme.darkInputDecorationTheme,
  );
}
