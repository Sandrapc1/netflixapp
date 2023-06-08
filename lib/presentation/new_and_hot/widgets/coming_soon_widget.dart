import 'package:flutter/material.dart';
import 'package:netflix_project/core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custon_button_widget.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String  posterPath;
  final String  movieName;
  final String description ;

  const ComingSoonWidget({super.key,
   required this.id, 
   required this.month, 
   required this.day, 
   required this.posterPath, 
   required this.movieName, 
   required this.description
   });
 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
         SizedBox(
          width: 50,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(month, 
              style: const TextStyle(fontSize: 16, color: kGreyColor)),
              Text(
                day,
                // ignore: prefer_const_constructors
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width -50,
          height: 350,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               VideoWidget(url: posterPath,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16,
                          // letterSpacing: -5,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // const Spacer(),
                   const Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: 'Remind me',
                        iconSize: 22,
                        textSize: 12,
                      )
                    ],
                  ),
                  kwidth,
                  const CustomButtonWidget(
                    icon: Icons.info,
                    title: 'Info',
                    iconSize: 22,
                    textSize: 12,
                  ),
                  kwidth20,
                ],
              ),
              kheight20,
              Text(
                'Coming on $day $month',
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
              ),
              kheight,
              Text(movieName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              kheight,
              Text(
                description,
                maxLines: 1,

                style: const TextStyle(color: kGreyColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
