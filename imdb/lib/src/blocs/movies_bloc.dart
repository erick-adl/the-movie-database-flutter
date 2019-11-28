import 'package:bloc_pattern/bloc_pattern.dart';
import 'dart:async';

import 'package:imdb/src/models/movie.dart';
import 'package:imdb/src/resources/movie_service.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc implements BlocBase {
  MovieService movieService;

  List<Movie> movies;

  final _moviesController = BehaviorSubject<List<Movie>>(seedValue: null);

//Stream output
  Stream<List<Movie>> get movieListControllerOut => _moviesController.stream;

//Stream update
  Function(List<Movie>) get movieListControllerUpdate =>
      _moviesController.sink.add;

  MoviesBloc() {
    movieService = MovieService();
    fetchListMovie();
  }

  fetchListMovie() async {
    try {
      if (null == movies) {
        movies = await movieService.fetchMovieListWithGenres();
      } else {
        movies += await movieService.fetchMovieListWithGenres();
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
