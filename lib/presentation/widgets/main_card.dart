import 'package:flutter/material.dart';
import 'package:netflix_project/core/constants.dart';

class MainCardHome extends StatelessWidget {
  final String imageUrl;
  const MainCardHome({
    super.key,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: kRadius10,
          image:  DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
               imageUrl
               ),
               ),
               ),
    );
  }
}
