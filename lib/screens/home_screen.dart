import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app_ui/data/movie.dart';
import 'package:movie_app_ui/utils/colors.dart';
import 'package:movie_app_ui/widgets/custom_card_normal.dart';
import 'package:movie_app_ui/widgets/custom_card_thumbnail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel> forYouItemList = List.of(forYouImages);
  List<MovieModel> popularItemList = List.of(popularImages);
  List<MovieModel> genresItemList = List.of(genresList);
  List<MovieModel> legendaryItemList = List.of(legendaryImages);
  PageController controller = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
  );
  int currentPage = 0;
  List tabBarIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.video,
    FontAwesomeIcons.user,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Hi, Malena!",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                                image: AssetImage("assets/actor_1.jpeg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: kSearchbarColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Search ....",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "For you",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    forYouCardLayout(forYouImages),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: kSearchbarColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: buildPageIndicatorWidget(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular",
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "See All",
                              style: TextStyle(
                                  color: Colors.white10,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    movieListBuilder(popularImages),
                    const SizedBox(height: 20),
                    const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Genres",
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "See All",
                              style: TextStyle(
                                  color: Colors.white10,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                    genresBuilder(genresList),
                    const SizedBox(height: 20),
                    const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Legendary",
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "See All",
                              style: TextStyle(
                                  color: Colors.white10,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    legendaryBuilder(legendaryImages),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 25,
            right: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15,
                  sigmaY: 15
                ),
                child: Container(
                  color: kSearchbarColor.withOpacity(0.5),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...tabBarIcons.map(
                        (e) => Icon(
                          e,
                          color: e == FontAwesomeIcons.house
                              ? Colors.white
                              : Colors.white54,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget forYouCardLayout(List<MovieModel> movieList) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.47,
      child: PageView.builder(
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        controller: controller,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return CustomCardThumbnail(
            imageAsset: movieList[index].imageAsset.toString(),
          );
        },
      ),
    );
  }

  List<Widget> buildPageIndicatorWidget() {
    List<Widget> list = [];
    for (int i = 0; i < forYouItemList.length; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white24,
          borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget movieListBuilder(List<MovieModel> movieList) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.27,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return CustomCardNormal(
            movieModel: movieList[index],
          );
        },
      ),
    );
  }

  Widget genresBuilder(List<MovieModel> genresList) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: genresList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 8,
                  bottom: 30,
                ),
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(genresList[index].imageAsset.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                child: Text(
                  genresList[index].movieName.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget legendaryBuilder(List<MovieModel> legendaryList) {
    return Container();
  }
}
