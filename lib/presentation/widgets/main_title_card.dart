import 'package:flutter/material.dart';
import 'package:netflix_project/core/constants.dart';
import 'main_card.dart';
import 'main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
    required this.posterList,
  });

  final String title;
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MainTitle(title: title),
      kheight20,
      LimitedBox(
        maxHeight: 200,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: List.generate(
            posterList.length,
            (index) => MainCardHome(
              imageUrl: posterList[index],
            ),
          ),
        ),
      )
    ]);
  }
}
