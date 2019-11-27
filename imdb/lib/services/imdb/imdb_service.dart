import 'dart:async';

import 'package:imdb/models/movie.dart';
import 'package:imdb/repository/imdb/imdb_repositorie.dart';

class ImdbService {
  Future<List<Movie>> getMovieListWithGenres() async {
    try {
      ImdbRepository _mdbRepository = new ImdbRepository();

      var generes = await _mdbRepository.getMoviesGenre();
      var movies = await _mdbRepository.getMovieList();

      movies.forEach((f) => {
            f.genreNames = generes
                .where((test) => f.genreIds.contains(test.id))
                .map((g) => g.name)
                .toList()
          });

      return movies;
    } catch (e) {
      throw Exception("Failed to get movies");
    }
  }
}
