import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../models/MovieDataa.dart';
import '../../../../network/api_requests.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 1200,
                  width: double.infinity,
                  child: Image.asset(
                    AppAssets.homeBg,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 1200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF121312).withOpacity(0.6),
                        Color(0xFF121312).withOpacity(0.8),
                        Color(0xFF121312),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.availableNoww,
                        height: 200,
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        height: 500,
                        child: FutureBuilder<MovieDataa?>(
                          future: ApiRequests.getMovies(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  "Error: ${snapshot.error}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            } else if (!snapshot.hasData ||
                                snapshot.data == null) {
                              return const Center(
                                child: Text(
                                  "No movies found",
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }

                            final movies =
                                snapshot.data!.data?.movies ?? [];

                            return CarouselSlider(
                              options: CarouselOptions(
                                height: 800,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                viewportFraction: 0.50,
                              ),
                              items: movies.map((movie) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Stack(
                                          alignment: Alignment.topLeft,
                                          children: [
                                            Image.network(
                                              movie.largeCoverImage ?? "",
                                              fit: BoxFit.fill,
                                              width: 370,
                                            ),
                                            Positioned(
                                              top: 8,
                                              left: 8,
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: Colors.black.withOpacity(0.6),
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "${movie.rating ?? "-"}",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    const SizedBox(width: 4),
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                      size: 16,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                      Image.asset(
                        AppAssets.watchNoww,
                        height: 200,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Action" ,style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),),
                          TextButton(onPressed: (){},
                              child: Row(
                                children: [
                                  Text("See More",style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                  Icon(Icons.arrow_forward_outlined,color: Colors.yellow,size: 25,)
                                ],
                              ),
                          )
                    ],
                  ),
                      SizedBox(
                        height: 250,
                        child: FutureBuilder<MovieDataa?>(
                          future: ApiRequests.getMovies(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  "Error: ${snapshot.error}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            } else if (!snapshot.hasData ||
                                snapshot.data == null) {
                              return const Center(
                                child: Text(
                                  "No movies found",
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }

                            final movies =
                                snapshot.data!.data?.movies ?? [];

                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                              itemBuilder: (context, index) {
                                final movie = movies[index];
                                return Container(
                                  width: 200,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(16),
                                        child: Image.network(
                                          movie.largeCoverImage ?? "",
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 60,
                                          padding:
                                          const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.black
                                                .withOpacity(0.6),
                                            borderRadius:
                                            const BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize:
                                            MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text(
                                                    "${movie.rating ?? "-"}",
                                                    style:
                                                    const TextStyle(
                                                      color:
                                                      Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      width: 4),
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 16,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),

                  ]
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
