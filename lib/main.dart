import 'package:flutter/material.dart';
import 'package:mykareem/pages/home_page.dart';
import 'package:mykareem/pages/profile_page.dart';
import 'app_theme.dart';
import 'pages/onboard_page.dart';
import 'pages/auth/sign_in_page.dart';
import 'pages/auth/register_page.dart';

void main() {
  runApp(MyKareemApp());
}

class MyKareemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyKareem',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      initialRoute: '/',
      routes: {
        '/': (_) => OnboardPage(),
        '/signin': (_) => SignInPage(),
        '/register': (_) => RegisterPage(),
        '/home': (_) => HomePage(),
        '/profile': (_) => ProfilePage(),
      },
    );
  }
}
