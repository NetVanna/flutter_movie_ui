import 'package:flutter/material.dart';

class CastAndCrew extends StatelessWidget {
  const CastAndCrew({super.key, required this.casts});

  final List casts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Cast",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 160,
            child: ListView.builder(
              itemCount: casts.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return castCard(casts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget castCard(final Map cast) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 80,
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: AssetImage(cast['image']), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            cast['name'],
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}
