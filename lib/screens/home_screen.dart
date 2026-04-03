import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movies_model.dart';
import 'package:movies_app/network_handler/network_handler.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // "Available Now" section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Image.asset("assets/images/availableNow.png"),
              ),
              const SizedBox(height: 12),
              FutureBuilder(
                future: NetworkHandler.getAllMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text("There is Error ${snapshot.error}");
                  }
                  if (!snapshot.hasData) {
                    return Text("No Movies Found");
                  }
                  MoviesModel? moviesModel = snapshot.data;
                  return SizedBox(
                    height: 260,
                    child: CarouselSlider.builder(
                      itemCount: moviesModel!.data!.movies!.length,
                      itemBuilder: (context, index, rearIndex) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: _MovieCard(
                            isFeatured: index == rearIndex,
                            movie: moviesModel.data!.movies![index],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 300,
                        viewportFraction: 0.55,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.5,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        initialPage: 2,
                        enableInfiniteScroll: true,
                        scrollPhysics: BouncingScrollPhysics(),
                      ),
                    ),
                  );
                },
              ),

              // Featured movie carousel
              const SizedBox(height: 24),
              // "Watch Now" title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Image.asset("assets/images/WatchNow.png"),
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
              FutureBuilder(
                future: NetworkHandler.getAllMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text("There is Error ${snapshot.error}");
                  }
                  if (!snapshot.hasData) {
                    return Text("No Movies Found");
                  }
                  MoviesModel? moviesModel = snapshot.data;
                  return SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: _MovieCard(
                            width: 120,
                            movie: moviesModel!.data!.movies![index],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

              // Action movies horizontal list
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  final bool isFeatured;
  final double? width;
  final Movies? movie;

  const _MovieCard({this.isFeatured = false, this.width, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              movie!.largeCoverImage!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                print("Error $error");
                return Container(
                  color: const Color(0xFF282A28),
                  child: const Center(
                    child: Icon(Icons.movie, color: Colors.white54, size: 40),
                  ),
                );
              },
            ),
            // Gradient overlay
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
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
                  color: const Color(0xFF282A28),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movie!.rating.toString(),
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
                movie!.title!,
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
