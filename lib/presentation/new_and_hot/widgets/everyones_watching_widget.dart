import 'package:flutter/material.dart';
import 'package:netflix_project/presentation/home/widgets/custon_button_widget.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
// import '../../home/widgets/custon_button_widget.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String  posterPath;
  final String  movieName;
  final String description;

  const EveryonesWatchingWidget({super.key, 
  required this.posterPath, 
  required this.movieName, 
  required this.description
  });
 

  @override
  Widget build(BuildContext context) {
    return   const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text('Titans',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        kheight,
        Text(
          'In Virginia, high school football is a way of life, an institution revered, each game celebrated more lavishly than Christmas, each playoff distinguished more grandly than any national holiday. ',
          style: TextStyle(color: kGreyColor, fontSize: 16),
        ),
        kheight20,
        VideoWidget(url:newAndHotTempImage),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.near_me_sharp,
              title: 'Shear',
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'MyList',
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 25,
              textSize: 16,
            ),
            kwidth20
          ],
        ),
      ],
    );
  }
}
