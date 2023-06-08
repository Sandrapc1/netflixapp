import 'package:flutter/material.dart';
import 'package:netflix_project/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        kwidth,
        Container(
          width: 40,
          height: 30,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/download.png')),
          ),
        ),
        kwidth,
      ],
    );
  }
}
