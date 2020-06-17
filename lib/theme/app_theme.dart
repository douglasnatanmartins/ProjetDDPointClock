import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpointclock/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  AppTheme(this.context);

  final BuildContext context;

  ThemeData get defaultTheme  => ThemeData(
    primaryColor: AppColors.primary,
    accentColor: AppColors.acent,
    textTheme: GoogleFonts.deliusTextTheme(
      Theme.of(context).textTheme
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity
  );
}