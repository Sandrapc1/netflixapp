import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:netflix_project/core/colors/colors.dart';
import 'package:netflix_project/presentation/downloads/widget/screen_downloads.dart';
import 'package:netflix_project/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_project/presentation/home/screen_home.dart';
import 'package:netflix_project/presentation/main_page/widgets/bottam_nav.dart';
import 'package:netflix_project/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_project/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottamNaviagtionWidget(),
    );
  }
}
