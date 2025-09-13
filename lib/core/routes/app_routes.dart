import 'package:flutter/material.dart';
import 'package:flutter_project/auth/forget_password/forget_password_view.dart';
import 'package:flutter_project/auth/register/register_view.dart';
import 'package:flutter_project/auth/reset_password/reset_password.dart';
import 'package:flutter_project/core/routes/page_routes.dart';
import 'package:flutter_project/modules/home/sub_modules/browse_tab/browse_view.dart';
import 'package:flutter_project/modules/home/sub_modules/profile_tab/profile_view.dart';
import 'package:flutter_project/modules/onboarding/onboarding_view.dart';

import '../../auth/login/login_view.dart';
import '../../modules/home/home_view.dart';
import '../../modules/home/sub_modules/home_tab/home_tab_view.dart';
import '../../modules/home/sub_modules/search_tab/search_view.dart';
import '../../modules/splash/splash_view.dart';
import '../../modules/update_profile/update_profile_view.dart';

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
      case PageRouteName.update_profile:
        return MaterialPageRoute(
            builder: (_) => const UpdateProfileView(),
            settings: settings
        );
      case PageRouteName.reset_password:
        return MaterialPageRoute(
            builder: (_) => const ResetPassword(),
            settings: settings
        );
      case PageRouteName.home_tab:
        return MaterialPageRoute(
            builder: (_) => const HomeTabView(),
            settings: settings
        );
      case PageRouteName.search_tab:
        return MaterialPageRoute(
            builder: (_) => const SearchView(),
            settings: settings
        );
      case PageRouteName.browse_tab:
        return MaterialPageRoute(
            builder: (_) => const BrowseView(),
            settings: settings
        );
      case PageRouteName.profile_tab:
        return MaterialPageRoute(
            builder: (_) => const ProfileView(),
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