import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class HoubagoTheme {
  HoubagoTheme._();
  
  // Couleur principale (Orange) et ses variantes
  static const Color primary = Color(0xFFDFA160);
  static const Color primaryLight = Color(0xFFFFD4A0);
  static const Color primaryLighter = Color(0xFFFFE7C7);
  static const Color primaryDark = Color(0xFFB77B35);
  static const Color primaryDarker = Color(0xFF8F5718);

  // Couleur secondaire (Bleu-gris) et ses variantes
  static const Color secondary = Color(0xFF607D8B);
  static const Color secondaryLight = Color(0xFF90A4AE);
  static const Color secondaryLighter = Color(0xFFCFD8DC);
  static const Color secondaryDark = Color(0xFF455A64);
  static const Color secondaryDarker = Color(0xFF263238);

  // Couleurs de fond
  static const Color background = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFFE0E0E0);
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceColor = Color(0xFFFFFFFF);

  // Couleurs de texte
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);
  static const Color textLight = Color(0xFFFFFFFF);

  // Couleurs d'état
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFA726);
  static const Color info = Color(0xFF29B6F6);

  // Couleurs d'accentuation
  static const Color accent1 = Color(0xFFFFB74D);
  static const Color accent2 = Color(0xFF90CAF9);

  // Styles de composants
  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: backgroundLight,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    border: _defaultInputBorder,
    enabledBorder: _defaultInputBorder,
    focusedBorder: _focusedInputBorder,
    errorBorder: _errorInputBorder,
    focusedErrorBorder: _errorInputBorder,
    labelStyle: textTheme.labelLarge?.copyWith(color: textSecondary),
    hintStyle: textTheme.bodyMedium?.copyWith(color: textHint),
    prefixIconColor: secondary,
    suffixIconColor: secondary,
    errorStyle: textTheme.bodySmall?.copyWith(color: error),
  );

  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primary,
    foregroundColor: textLight,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 2,
    textStyle: buttonText,
  );

  static final ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: primary,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    textStyle: textTheme.labelLarge,
  );

  static final CardTheme cardTheme = CardTheme(
    color: surfaceColor,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );

  static final AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: primary,
    foregroundColor: textLight,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: textTheme.titleLarge?.copyWith(color: textLight),
    iconTheme: IconThemeData(color: textLight),
  );

  // Bordures personnalisées pour les inputs
  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: secondaryLight, width: 1),
  );

  static final _focusedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: primary, width: 2),
  );

  static final _errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: error, width: 1),
  );

  // Configuration des styles de texte
  static final TextTheme textTheme = TextTheme(
    // Grands titres
    displayLarge: GoogleFonts.poppins(
      fontSize: 57,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.25,
      height: 1.12,
      color: textPrimary,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 45,
      fontWeight: FontWeight.w800,
      letterSpacing: 0,
      height: 1.15,
      color: textPrimary,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 36,
      fontWeight: FontWeight.w800,
      letterSpacing: 0,
      height: 1.22,
      color: textPrimary,
    ),

    // Titres
    headlineLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      letterSpacing: 0,
      height: 1.25,
      color: textPrimary,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w800,
      letterSpacing: 0,
      height: 1.29,
      color: textPrimary,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      letterSpacing: 0,
      height: 1.33,
      color: textPrimary,
    ),

    // Sous-titres
    titleLarge: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      height: 1.27,
      color: textPrimary,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
      height: 1.5,
      color: textPrimary,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      height: 1.43,
      color: textPrimary,
    ),

    // Corps de texte
    bodyLarge: GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.5,
      color: textPrimary,
    ),
    bodyMedium: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
      height: 1.43,
      color: textPrimary,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.4,
      height: 1.33,
      color: textSecondary,
    ),

    // Labels
    labelLarge: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      height: 1.43,
      color: textPrimary,
    ),
    labelMedium: GoogleFonts.lato(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      height: 1.33,
      color: textPrimary,
    ),
    labelSmall: GoogleFonts.lato(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.45,
      color: textSecondary,
    ),
  );

  // Styles additionnels pour cas spécifiques
  static final TextStyle buttonText = GoogleFonts.lato(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
    height: 1.43,
    color: textLight,
  );

  static final TextStyle captionBold = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.4,
    height: 1.33,
    color: textPrimary,
  );

  static final TextStyle overline = GoogleFonts.lato(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    height: 1.6,
    color: textSecondary,
  );
}
