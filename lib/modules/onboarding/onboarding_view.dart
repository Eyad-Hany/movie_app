import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme_manager/collor_pallete.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      "image": AppAssets.movie_poster,
      "title": "Find Your Next \n Favorite Movie Here",
      "desc":
      "Get access to a huge library of movies \n to suit all tastes. You will surely like it.",
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
    var theme = Theme.of(context);
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (i) => setState(() => _currentIndex = i),
        itemBuilder: (_, i) {
          final page = pages[i];
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(page["image"]!, fit: BoxFit.cover),

              // First page style
              if (i == 0)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          page["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          page["desc"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white60,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPallete.yellow,
                            foregroundColor:
                            ColorPallete.scaffoldBackgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: const Size(double.infinity, 60),
                          ),
                          child: Text(
                            page["btn"]!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF121312),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          page["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),

                        if (i != pages.length - 1) ...[
                          const SizedBox(height: 15),
                          Text(
                            page["desc"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white60,
                            ),
                          ),
                          const SizedBox(height: 30),
                        ] else
                          const SizedBox(height: 20),

                        // If page 1 (second page)
                        if (i == 1)
                          ElevatedButton(
                            onPressed: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPallete.yellow,
                              foregroundColor:
                              ColorPallete.scaffoldBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              minimumSize: const Size(double.infinity, 60),
                            ),
                            child: Text(
                              page["btn"]!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        else
                          Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorPallete.yellow,
                                  foregroundColor:
                                  ColorPallete.scaffoldBackgroundColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  minimumSize: const Size(double.infinity, 60),
                                ),
                                onPressed: () {
                                  if (i == pages.length - 1) {
                                    _finishOnboarding();
                                  } else {
                                    _controller.nextPage(
                                      duration:
                                      const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Text(page["btn"]!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              if (i != pages.length - 1)
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Colors.yellow),
                                    foregroundColor: Colors.yellow,
                                    minimumSize:
                                    const Size(double.infinity, 60),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),

                                  ),
                                  onPressed: () {
                                    _controller.previousPage(
                                      duration:
                                      const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: const Text("Back",
                                  style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
