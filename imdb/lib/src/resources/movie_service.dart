import 'dart:async';

import 'package:imdb/src/models/movie.dart';
import 'package:imdb/src/resources/movie_repository.dart';



class MovieService {
  Future<List<Movie>> fetchMovieListWithGenres() async {
    try {
      MovieRepository _movieRepository = new MovieRepository();

      var generes = await _movieRepository.fetchAllGenres();
      var movies = await _movieRepository.fetchAllMovies();

      movies.forEach((f) => {
            f.genreNames = generes
                .where((test) => f.genreIds.contains(test.id))
                .map((g) => g.name)
                .toList()
          });

      return movies;
    } catch (e) {
      throw Exception("Failed to get movies list: ${e.toString().substring(10)}");
    }
  }
}
