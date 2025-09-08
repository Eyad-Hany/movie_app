import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final pageController_onboarding = PageController();
  int _currentIndex=0;

  final List<Map<String, String>> pages =[
    {
      "image": AppAssets.movie_poster,
      "title": "Find Your Next Favorite Movie Here",
      "desc":
      "Get access to a huge library of movies to suit all tastes. You will surely like it.",
      "btn": "Explore Now",
    },
    {
      "image": AppAssets.onboarding1,
      "title": "Discover Movies",
      "desc":
      "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
      "btn": "Next",
    },
    {
      "image": AppAssets.onboarding2,
      "title": "Explore All Genres",
      "desc":
      "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
      "btn": "Next",
    },
    {
      "image": AppAssets.onboarding3,
      "title": "Create Watchlists",
      "desc":
      "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
      "btn": "Next",
    },
    {
      "image": AppAssets.onboarding4,
      "title": "Rate, Review, and Learn",
      "desc":
      "Share your thoughts on the movies you’ve watched. Dive deep into film details and help others discover great movies with your reviews.",
      "btn": "Next",
    },
    {
      "image": AppAssets.onboarding5,
      "title": "Start Watching Now",
      "desc": ".",
      "btn": "Finish",
    },

  ];

  Future<void> _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
