import 'package:bloc_pattern/bloc_pattern.dart';
import 'dart:async';

import 'package:imdb/models/movie.dart';
import 'package:imdb/services/imdb/imdb_service.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc implements BlocBase {
  ImdbService imdbService;

  List<Movie> movies;

  final _moviesController = BehaviorSubject<List<Movie>>(seedValue: null);

//Stream output
  Stream<List<Movie>> get movieListControllerOut => _moviesController.stream;

//Stream update
  Function(List<Movie>) get movieListControllerUpdate =>
      _moviesController.sink.add;

  MoviesBloc() {
    imdbService = ImdbService();
    fetchListMovie();
  }

  fetchListMovie() async {
    try {
      if (null == movies) {
        movies = await imdbService.getMovieListWithGenres();
      } else {
        movies += await imdbService.getMovieListWithGenres();
      }
      movieListControllerUpdate(movies);
    } catch (e) {
      _moviesController.sink.addError(e);
    }
  }

  @override
  void dispose() {
    _moviesController.close();
  }
}
