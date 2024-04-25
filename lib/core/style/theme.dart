import 'package:flutter/material.dart';
import 'package:market_app_web_2/core/style/app_colors.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
    foregroundColor: Colors.white,
  ),
);
