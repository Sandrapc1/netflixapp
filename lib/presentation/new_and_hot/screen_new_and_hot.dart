// ignore_for_file: sort_child_properties_last

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_project/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_project/core/colors/colors.dart';
import 'package:netflix_project/core/constants.dart';
import 'package:netflix_project/presentation/new_and_hot/widgets/everyones_watching_widget.dart';
// import 'package:netflix_project/presentation/new_and_hot/widgets/everyones_watching_widget.dart';
// import 'package:netflix_project/presentation/new_and_hot/widgets/everyones_watching_widget.dart';

import 'widgets/coming_soon_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                kwidth,
                Container(
                  width: 30,
                  height: 10,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/download.png')),
                  ),
                ),
                kwidth,
              ],
              bottom: TabBar(
                  labelColor: kButtonColorBlack,
                  unselectedLabelColor: kButtonColorWhite,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: kwhiteColor, borderRadius: kRadius30),
                  tabs: const [
                    Tab(
                      text: '🍿 Coming Soon',
                    ),
                    Tab(
                      text: '''👀 Everyone's watching''',
                    )
                  ]),
            ),
          ),
          body: const TabBarView(children: [
            ComingSoonList(key:Key('coming_soon') ),
           EveryonesWatchingList(key:Key('every_is_watching')),
          ]),
        ));
  }

  // Widget _buildComingSoon() {
  //   return ListView.builder(
  //       itemCount: 10,
  //       itemBuilder: (BuildContext context, index) => const ComingSoonWidget());
  // }

  // Widget _buildEveryoneWatching() {
  //   return ListView.builder(
  //       itemCount: 10,
  //       itemBuilder: (BuildContext context, index) =>
  //           const SizedBox());
  // }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2,));
              }else{
                if (state.hasError) {
                  return const Center(
                    child:Text('Error while loading coming soon list'));
                }else{
                  if (state.comingSoonList.isEmpty) {
                    return const Center(
                    child:Text('Coming soon list ids empty '));
                  }else{
                  return ListView.builder(
                  itemCount: state.comingSoonList.length,
                  itemBuilder: (BuildContext context, index){
                    final movie = state.comingSoonList[index];
                    if (movie.id==null) {
                      return const SizedBox();
                    }
                  log(movie.releaseDate.toString());
                 
                 String month = '';
                String date = '';
                try {
                  final _date = DateTime.tryParse(movie.releaseDate!);
                  final formattedDate =
                      DateFormat.yMMMMd('en_US').format(_date!);
                  print(formattedDate);
                                    log(formattedDate.toString());


                  month = formattedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
 }
                  
                  
                  return ComingSoonWidget(
                    id: movie.id.toString(), 
                    month:month, 
                    day:date , 
                    posterPath: '$imageAppendUrl${movie.posterPath}', 
                    movieName: movie.originalTitle??'No title', 
                    description: movie.overview??'No description'
                    );
            }
                );

                  }        
                }
              }

  
      },
    );
  }
}


class EveryonesWatchingList extends StatelessWidget {
  const EveryonesWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInEveryoneIsWatching());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2,));
              }else{
                if (state.hasError) {
                  return const Center(
                    child:Text('Error while loading coming soon list'));
                }else{
                  if (state.everyOneIsWatchingList.isEmpty) {
                    return const Center(
                    child:Text('Coming soon list ids empty '));
                  }else{
                  return ListView.builder(
                  itemCount: state.everyOneIsWatchingList.length,
                  itemBuilder: (BuildContext context, index){
                    final movie = state.everyOneIsWatchingList[index];
                    if (movie.id==null) {
                      return const SizedBox();
                    }
                  // log(movie.releaseDate.toString());
                  String month ='';
                  String date ='';
                  try {
                  final _data = DateTime.tryParse(movie.releaseDate!);
                  final formateDate = DateFormat.yMMMMd('en_US').format(_data!);
                  // log(formateDate.toString());
                  month = formateDate.
                  split('')
                  .first
                  .substring(0,3)
                  .toUpperCase();
                  date = movie.releaseDate!.split('_')[1];
                  } catch (_) {
                    month='';
                    date='';
                  }
                  
                  final tv= state.everyOneIsWatchingList[index];

                  return EveryonesWatchingWidget(
                    posterPath: '$imageAppendUrl${tv.posterPath}', 
                    movieName: tv.originalName?? 'No name provided', 
                    description: tv.overview?? 'No Description'
                    );        
                  //
                
            }
            
                );

                  }        
                }
              }

  
      },
    );
  }
}