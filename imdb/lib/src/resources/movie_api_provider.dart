import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:imdb/imdb_key.dart';
import 'package:imdb/src/models/dto/genres.dart';
import 'package:imdb/src/models/dto/upcoming.dart';
import 'package:imdb/src/models/genre.dart';
import 'package:imdb/src/models/movie.dart';
import 'package:http/http.dart' show Client, Response;

class MovieApiProvider {
  Client client = Client();
  final _apiKey = IMDBKey.apiKey;
  final _baseUrl = "https://api.themoviedb.org/3/";
  final _urlUpcoming = "movie/upcoming";
  final _urlGenres = "genre/movie/list";
  int _page = 1;

  Future<List<Movie>> fetchMovieList() async {
    Response response;
    if (_apiKey != '<IMDB_API_KEY>') {
      response = await client
          .get("$_baseUrl$_urlUpcoming?api_key=$_apiKey&page=$_page");
    } else {
      throw Exception('Please add your API key');
    }
    if (response.statusCode == 200) {
      _page++;
      return upcomingFromJson(response.body).movies;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<Genre>> fetchGenreList() async {
    final response = await client.get("$_baseUrl$_urlGenres?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return genresFromJson(response.body).genres;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
