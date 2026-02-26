import 'package:flutter/material.dart';
import 'login.dart';

class OnboardingPage extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _index = 0;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/xl_bad-boys-ride-or-die-movie-poster_591dcde0 1.png',
      'title': 'Create Watchlists',
      'subtitle':
          'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres..'
    },
    {
      'image': 'assets/xl_9419884_887ed6c7 1.png',
      'title': 'Rate, Review, and Learn',
      'subtitle':
          'Share your thoughts on the movies you\'ve watched. Dive deep into film details and help others discover great movies with your reviews..'
    },
    {
      'image':
          'assets/1917_-_Sam_Mendes_-_Hollywood_War_Film_Classic_English_Movie_Poster_9ef86295-4756-4c71-bb4e-20745c5fbc1a 1.png',
      'title': 'Start Watching Now',
      'subtitle': ''
    },
  ];

  void _next() {
    if (_index < pages.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
    }
  }

  void _back() {
    if (_index > 0) {
      _controller.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.of(context).maybePop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (i) => setState(() => _index = i),
        itemBuilder: (context, i) {
          final page = pages[i];
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(page['image']!, fit: BoxFit.cover),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.75)
                      ],
                      stops: const [0.5, 1.0],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 0,
                right: 0,
                child: Center(
                  child: Text('OnBoarding',
                      style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                ),
              ),
              // Bottom card
              Positioned(
                left: 0,
                right: 0,
                bottom: 24,
                child: Center(
                  child: SizedBox(
                    width: 430,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF121312),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(22),
                          bottomRight: Radius.circular(22),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(page['title']!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center),
                          const SizedBox(height: 8),
                          Text(page['subtitle']!,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                height: 1.0,
                                letterSpacing: 0,
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center),
                          const SizedBox(height: 16),
                          // Buttons
                          Column(
                            children: [
                              // Next / Finish button (amber fill)
                              SizedBox(
                                width: 398,
                                height: 55,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15),
                                    onTap: _next,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF6BD00),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        i < pages.length - 1
                                            ? 'Next'
                                            : 'Finish',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Back button
                              SizedBox(
                                width: 398,
                                height: 55,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: const Color(0xFF121312),
                                    side: const BorderSide(
                                        color: Colors.amber, width: 2),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  onPressed: _back,
                                  child: const Text('Back',
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
