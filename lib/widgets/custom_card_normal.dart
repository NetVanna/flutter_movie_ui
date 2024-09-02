import 'package:flutter/material.dart';
import 'package:movie_app_ui/data/movie.dart';
import 'package:movie_app_ui/screens/detail_screen.dart';

class CustomCardNormal extends StatelessWidget {
  final MovieModel movieModel;

  const CustomCardNormal({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailScreen(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 200,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(movieModel.imageAsset.toString()),
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            bottom: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieModel.movieName!,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        movieModel.year!,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    Text(
                      movieModel.movieRating!,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 15,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
