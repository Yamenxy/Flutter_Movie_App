import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              // "Available Now" section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Available Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 8,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Featured movie carousel
              SizedBox(
                height: 260,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.65),
                  itemCount: _featuredMovies.length,
                  itemBuilder: (context, index) {
                    final movie = _featuredMovies[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: _MovieCard(
                        title: movie['title']!,
                        imagePath: movie['image']!,
                        rating: movie['rating']!,
                        isFeatured: index == 0,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // "Watch Now" title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Watch Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 8,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Action genre section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Action',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See More →',
                        style: TextStyle(
                          color: Color(0xFFF6BD00),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Action movies horizontal list
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _actionMovies.length,
                  itemBuilder: (context, index) {
                    final movie = _actionMovies[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _MovieCard(
                        title: movie['title']!,
                        imagePath: movie['image']!,
                        rating: movie['rating']!,
                        width: 120,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// Movie data
final List<Map<String, String>> _featuredMovies = [
  {
    'title': '1917',
    'image': 'assets/images/Movies Posters.png',
    'rating': '7.7',
  },
  {
    'title': 'The Godfather',
    'image': 'assets/images/The Godfather 1.png',
    'rating': '7.7',
  },
  {
    'title': 'Action Movie',
    'image': 'assets/images/on2.png',
    'rating': '8.1',
  },
];

final List<Map<String, String>> _actionMovies = [
  {
    'title': 'Captain America',
    'image': 'assets/images/Movies Posters.png',
    'rating': '7.7',
  },
  {
    'title': 'The Dark Knight',
    'image': 'assets/images/The Godfather 1.png',
    'rating': '7.7',
  },
  {
    'title': 'Spider-Man',
    'image': 'assets/images/on2.png',
    'rating': '8.0',
  },
  {
    'title': 'Black Widow',
    'image': 'assets/images/The Godfather 2.png',
    'rating': '7.2',
  },
];

class _MovieCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String rating;
  final bool isFeatured;
  final double? width;

  const _MovieCard({
    required this.title,
    required this.imagePath,
    required this.rating,
    this.isFeatured = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: const Color(0xFF282A28),
                child: const Center(
                  child: Icon(Icons.movie, color: Colors.white54, size: 40),
                ),
              ),
            ),
            // Gradient overlay
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),
            ),
            // Rating badge
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF282A28).withOpacity(0.85),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      rating,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Icon(Icons.star, color: Color(0xFFF6BD00), size: 14),
                  ],
                ),
              ),
            ),
            // Title at bottom
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
