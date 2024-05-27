import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'gen_l10n/app_localizations.dart'; // Ensure this import is correct
import 'screens/welcome_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/home_screen.dart';
import 'screens/payments_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart'; // Import SplashScreen

void main() {
  runApp(SwipeApp());
}

class SwipeApp extends StatefulWidget {
  @override
  _SwipeAppState createState() => _SwipeAppState();

  static _SwipeAppState? of(BuildContext context) => context.findAncestorStateOfType<_SwipeAppState>();
}

class _SwipeAppState extends State<SwipeApp> {
  Locale _locale = Locale('en', '');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe',
      locale: _locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('عر', ''), // Arabic
        const Locale('fr', ''), // French
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // Start with the SplashScreen
    );
  }
}
