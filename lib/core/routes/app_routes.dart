import 'package:flutter/material.dart';
import 'package:flutter_project/auth/forget_password/forget_password_view.dart';
import 'package:flutter_project/auth/register/register_view.dart';
import 'package:flutter_project/core/routes/page_routes.dart';
import 'package:flutter_project/modules/onboarding/onboarding_view.dart';

import '../../auth/login/login_view.dart';
import '../../modules/home/home_view.dart';
import '../../modules/splash/splash_view.dart';

abstract class AppRoutes{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name){
      case PageRouteName.initial:
        return MaterialPageRoute(
            builder: (_) => const SplashView(),
            settings: settings
        );
      case PageRouteName.home:
        return MaterialPageRoute(
            builder: (_) => const HomeView(),
            settings: settings
        );
      case PageRouteName.onboarding:
        return MaterialPageRoute(
            builder: (_) => const OnboardingView(),
            settings: settings
        );
      case PageRouteName.login:
        return MaterialPageRoute(
            builder: (_) => const LoginView(),
            settings: settings
        );
      case PageRouteName.register:
        return MaterialPageRoute(
            builder: (_) => const RegisterView(),
            settings: settings
        );
      case PageRouteName.forget_password:
        return MaterialPageRoute(
            builder: (_) => const ForgetPasswordView(),
            settings: settings
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const SplashView(),
            settings: settings
        );
    }
  }
}