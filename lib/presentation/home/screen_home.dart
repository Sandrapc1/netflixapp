
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix_project/application/home/home_bloc.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/home/widgets/background_card.dart';
import 'package:netflix_project/presentation/home/widgets/number_title_card.dart';

import '../Widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  void initState() {
    // funreview();
  }

  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (ctx, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.hasError) {
                      return const Center(
                          child: Text(
                        'Error while getting data',
                        style: TextStyle(color: Colors.white),
                      ));
                    }

                    //releaased Pastyear
                    final _relesedPastyear = state.pastYearMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _relesedPastyear.shuffle();

                    //Trending
                    final _trending = state.trendingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _trending.shuffle();

                    //tensed dramas

                    final _trenseDramas = state.tensedDramasMoveList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _trenseDramas.shuffle();

                    //sounth Indian movies
                    final _southIndianMovies =
                        state.sountindianMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _southIndianMovies.shuffle();

                    //top 10 tv show
                    final _top10TvShow = state.trendingTvList.map((t) {
                      return '$imageAppendUrl${t.posterPath}';
                    }).toList();
                    _top10TvShow.shuffle();

                    log(_top10TvShow.length.toString());

                    //ListView
                    return ListView(
                      children: [
                        const BackgroundCard(),
                        const SizedBox(height: 25,),
                        if (_relesedPastyear.length >= 10)
                          MainTitleCard(
                            title: 'Released in the Past Year',
                            posterList: _relesedPastyear.sublist(0, 10),
                          ),
                          const SizedBox(height: 25,),
                        if (_trending.length >= 10)
                          MainTitleCard(
                            title: 'Trending Now',
                            posterList: _trending.sublist(0, 10),
                          ),
                          const SizedBox(height: 25),
                        if (_top10TvShow.length >= 10)
                          NumberTitleCard(
                              postersList: _top10TvShow.sublist(0, 10)),
                              const SizedBox(height: 25,),
                        if (_trenseDramas.length >= 10)
                          MainTitleCard(
                            title: 'Tense Dramas',
                            posterList: _trenseDramas.sublist(0, 10),
                          ),
                          const SizedBox(height: 25),
                        if (_southIndianMovies.length >= 10)
                          MainTitleCard(
                            title: 'South Indian Cinema',
                            posterList: _southIndianMovies.sublist(0, 10),
                          ),
                          const SizedBox(height: 25),
                      ],
                    );
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 2000),
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/netflix-logo.png",
                                  width: 90,
                                  height: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                kwidth,
                             Container(
                                  width: 40,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/download.png')),
                                  ),
                                ),
                                kwidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'TV Shows',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Movies',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Categories',
                                  style: kHomeTitleText,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : kheight,
              ],
            ),
          );
        },
),
);
}
}

