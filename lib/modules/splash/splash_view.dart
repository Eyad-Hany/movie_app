import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/routes/page_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
      super.initState();
      _checkFirstSeen();
  }

  Future<void> _checkFirstSeen() async {
    final prefs = await SharedPreferences.getInstance();
    final seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    if (seenOnboarding) {
      Navigator.pushReplacementNamed(context, PageRouteName.login);
    } else {
      Navigator.pushReplacementNamed(context, PageRouteName.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(AppAssets.splashScreen,
        ),
      ),

    );
  }
}
