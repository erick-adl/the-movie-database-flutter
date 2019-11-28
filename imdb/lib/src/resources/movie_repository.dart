import 'dart:async';
import 'package:imdb/src/models/genre.dart';
import 'package:imdb/src/models/movie.dart';

import 'movie_api_provider.dart';

class MovieRepository {
  final moviesApiProvider = MovieApiProvider();

  Future<List<Movie>> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<List<Genre>> fetchAllGenres() => moviesApiProvider.fetchGenreList();
}
