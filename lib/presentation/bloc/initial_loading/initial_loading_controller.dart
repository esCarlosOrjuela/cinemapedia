import 'package:cinemapedia/domain/repositories/imovies_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'initial_loading_state.dart';

class InitialLoadingController extends Cubit<LoadingState> {
  final moviesRepository = GetIt.instance.get<IMoviesRepository>();

  InitialLoadingController(BuildContext _) : super(InitialLoadingState()) {
    _loadMovies();
  }

  void _loadMovies() async {
    var response = await Future.wait([
      moviesRepository.getNowPlaying(),
      moviesRepository.getUpcoming(),
      moviesRepository.gePopular(),
      moviesRepository.getTopRated(),
    ]);

    emit(SteadyLoadingState(
      nowPlayingMovies: response[0].isEmpty ? [] : response[0].sublist(0, 8),
      slideShowMovies: response[0],
      popularMovies: response[1],
      upcomingMovies: response[2],
      topRatedMovies: response[3],
    ));
  }
}
