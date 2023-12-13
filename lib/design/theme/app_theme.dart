import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ricky_and_mory_app/app_export.dart';

class AppTheme {
  static lightTheme() {
    return _baseTheme.copyWith(
      appBarTheme: AppBarTheme(
        toolbarHeight: kToolbarHeight - (kToolbarHeight * .1),
        backgroundColor: Colors.white.withOpacity(0.5),
      ),
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      textTheme: _textTheme(Colors.black),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          surfaceTintColor: Colors.black,
          textStyle: _baseTheme.textTheme.titleSmall!,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 2, color: AppColors.darkBlue3),
          foregroundColor: AppColors.darkBlue3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkBlue3,
          foregroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  static darkTheme() {
    return _baseTheme.copyWith(
      appBarTheme: const AppBarTheme(
        toolbarHeight: kToolbarHeight - (kToolbarHeight * .1),
        backgroundColor: Colors.black54,
      ),
      scaffoldBackgroundColor: Colors.black54,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      textTheme: _textTheme(Colors.white),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          surfaceTintColor: Colors.white,
          textStyle: _baseTheme.textTheme.titleSmall!.copyWith(
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightBlue7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 2, color: AppColors.whiteColor),
          foregroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  static final ThemeData _baseTheme = ThemeData(
    useMaterial3: true,
  );

  static TextTheme _textTheme(Color textColor) {
    final theme = GoogleFonts.montserratTextTheme();
    return TextTheme(
      displayLarge: theme.displayLarge!
          .copyWith(color: textColor, fontWeight: FontWeight.bold),
      displayMedium: theme.displayMedium!
          .copyWith(color: textColor, fontWeight: FontWeight.bold),
      displaySmall: theme.displaySmall!
          .copyWith(color: textColor, fontWeight: FontWeight.bold),
      headlineLarge: theme.headlineLarge!
          .copyWith(color: textColor, fontWeight: FontWeight.bold),
      headlineMedium: theme.headlineMedium!
          .copyWith(color: textColor, fontWeight: FontWeight.bold),
      headlineSmall: theme.headlineSmall!
          .copyWith(color: textColor, fontWeight: FontWeight.bold),
      titleLarge: theme.titleLarge!
          .copyWith(color: textColor, fontWeight: FontWeight.bold),
      titleMedium: theme.titleMedium!
          .copyWith(color: textColor, fontWeight: FontWeight.bold),
      titleSmall: theme.titleSmall!
          .copyWith(color: textColor, fontWeight: FontWeight.bold),
      bodyLarge: theme.bodyLarge!.copyWith(color: textColor),
      bodyMedium: theme.bodyMedium!.copyWith(color: textColor),
      bodySmall: theme.bodySmall!.copyWith(color: textColor),
      labelLarge: theme.labelLarge!.copyWith(color: textColor),
      labelMedium: theme.labelMedium!.copyWith(color: textColor),
      labelSmall: theme.labelSmall!.copyWith(color: textColor),
    );
  }
}
