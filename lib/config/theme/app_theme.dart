import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTheme {
  const AppTheme._();

  static final light = FlexThemeData.light(
    scheme: FlexScheme.sanJuanBlue,
    appBarStyle: FlexAppBarStyle.primary,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
    appBarOpacity: 0.95,
    appBarElevation: 0,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: GoogleFonts.lato().fontFamily,
  );
}
