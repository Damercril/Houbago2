import 'package:flutter/material.dart';
import 'package:houbago/houbago/houbago_theme.dart';
import 'package:houbago/houbago/screens/login/login_screen.dart';
import 'package:houbago/houbago/screens/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Houbago',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: HoubagoTheme.primary,
        colorScheme: ColorScheme(
          primary: HoubagoTheme.primary,
          secondary: HoubagoTheme.secondary,
          surface: HoubagoTheme.surfaceColor,
          background: HoubagoTheme.background,
          error: HoubagoTheme.error,
          onPrimary: HoubagoTheme.textLight,
          onSecondary: HoubagoTheme.textLight,
          onSurface: HoubagoTheme.textPrimary,
          onBackground: HoubagoTheme.textPrimary,
          onError: HoubagoTheme.textLight,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: HoubagoTheme.background,
        textTheme: HoubagoTheme.textTheme,
        inputDecorationTheme: HoubagoTheme.inputDecorationTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: HoubagoTheme.elevatedButtonStyle,
        ),
        textButtonTheme: TextButtonThemeData(
          style: HoubagoTheme.textButtonStyle,
        ),
        cardTheme: HoubagoTheme.cardTheme,
        appBarTheme: HoubagoTheme.appBarTheme,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const MainScreen(),
      },
    );
  }
}
