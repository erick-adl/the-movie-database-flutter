import 'package:bloc_pattern/bloc_pattern.dart';
import 'dart:async';

import 'package:imdb/models/movie.dart';
import 'package:imdb/repository/imdb/imdb_repositorie.dart';
import 'package:imdb/services/imdb/imdb_service.dart';

class MoviesBloc implements BlocBase {
  ImdbRepository imdbRepository;
  ImdbService imdbService;

  List<Movie> movies;

  final StreamController<List<Movie>> _moviesController =
      StreamController<List<Movie>>();
  Stream get outMovies => _moviesController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  MoviesBloc() {
    imdbService = ImdbService();

    _searchController.stream.listen(_search);
  }

  void _search(String search) async {
    if (search != null) {
      _moviesController.sink.add([]);
      movies = await imdbService.getMovieListWithGenres();
    } else {
      movies += await imdbService.getMovieListWithGenres();
    }
    _moviesController.sink.add(movies);
  }

  @override
  void dispose() {
    _moviesController.close();
    _searchController.close();
  }
}
