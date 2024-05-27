import 'package:flutter/material.dart';
import '../gen_l10n/app_localizations.dart'; // Correct path for localization import
import 'onboarding_screen.dart';
import 'login_screen.dart';
import '../main.dart'; // Import the main file to access the app state

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<Locale>(
              value: Localizations.localeOf(context),
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  SwipeApp.of(context)?.setLocale(newLocale);
                }
              },
              items: [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('EN'),
                ),
                DropdownMenuItem(
                  value: Locale('ar'),
                  child: Text('AR'),
                ),
                DropdownMenuItem(
                  value: Locale('fr'),
                  child: Text('FR'),
                ),
              ],
            ),
            Text(
              AppLocalizations.of(context)!.appTitle,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.welcomeMessage,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
              },
              child: Text(AppLocalizations.of(context)!.newUser),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(AppLocalizations.of(context)!.login),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
