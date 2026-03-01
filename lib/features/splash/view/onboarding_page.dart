import 'package:flutter/material.dart';
import '../../../core/utilit/colors_app.dart';
import '../../../screens/onboarding.dart';

class OnboardingPage extends StatefulWidget {
  static const String routeName = '/onboarding';

  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _index = 0;

  final List<Map<String, dynamic>> pages = [
    {
      'image': 'assets/images/Movies Posters.png',
      'overlay': true,
      'overlayImage': 'assets/images/Rectangle 1.png',
      'title': 'Find Your Next Favorite Movie Here',
      'subtitle':
      'Get access to a huge library of movies to suit all tastes. You will surely like it.',
      'buttonText': 'Explore Now',
      'showBack': false,
      'titleSize': 36.0,
      'subtitleSize': 20.0,
      'bottomOffset': 33.0,
      'containerColor': AppColors.lightBlackColor.withOpacity(0.6),
      'radius': 15.0,
    },
    {
      'image': 'assets/images/on2.png',
      'overlay': true,
      'overlayImage': 'assets/images/g_on2.png',
      'title': 'Discover Movies',
      'subtitle':
      'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
      'buttonText': 'Next',
      'showBack': false,
      'titleSize': 24.0,
      'subtitleSize': 20.0,
      'bottomOffset': 0.0,
      'containerColor': AppColors.lightBlackColor,
      'radius': 40.0,
    },
    {
      'image': 'assets/images/The Godfather 1.png',
      'overlay': true,
      'overlayImage': 'assets/images/The Godfather 2.png',
      'title': 'Explore All Genres',
      'subtitle':
      'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
      'buttonText': 'Next',
      'showBack': true,
      'titleSize': 24.0,
      'subtitleSize': 20.0,
      'bottomOffset': 0.0,
      'containerColor': AppColors.lightBlackColor,
      'radius': 40.0,
    },
  ];

  void _next() {
    if (_index < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        OnboardingScreens.routeName,
      );
    }
  }

  void _back() {
    if (_index > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  BorderRadius _getContainerRadius(int i) {
    if (i == 0) {
      return BorderRadius.circular(pages[i]['radius']);
    } else if (i == 1) {
      return BorderRadius.only(
        topLeft: Radius.circular(pages[i]['radius']),
        topRight: Radius.circular(pages[i]['radius']),
      );
    } else {
      return BorderRadius.only(
        topLeft: Radius.circular(pages[i]['radius']),
        topRight: Radius.circular(pages[i]['radius']),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemCount: pages.length,
          onPageChanged: (i) => setState(() => _index = i),
          itemBuilder: (context, i) {
            final page = pages[i];

            double imageBottom =
            (i == 0) ? 0 : MediaQuery.of(context).size.height * 0.25;

            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: imageBottom,
                  child: Image.asset(
                    page['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                if (page['overlay'] && page['overlayImage'] != '')
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: imageBottom,
                    child: Image.asset(
                      page['overlayImage'],
                      fit: BoxFit.cover,
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: page['bottomOffset']),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: page['containerColor'],
                        borderRadius: _getContainerRadius(i),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            page['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: page['titleSize'],
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            page['subtitle'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.whiteColor.withOpacity(0.6),
                              fontSize: page['subtitleSize'],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _next,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.yellowColor,
                                foregroundColor: AppColors.lightBlackColor,
                                padding:
                                const EdgeInsets.symmetric(vertical: 15),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(page['buttonText']),
                            ),
                          ),
                          if (page['showBack']) const SizedBox(height: 12),
                          if (page['showBack'])
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: _back,
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: AppColors.yellowColor,
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 15),
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: AppColors.yellowColor),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text('Back'),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}