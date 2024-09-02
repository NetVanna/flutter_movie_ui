import 'package:flutter/material.dart';

class CustomCardThumbnail extends StatelessWidget {
  const CustomCardThumbnail({super.key, required this.imageAsset});

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 20,
        bottom: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(5, 3)
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
