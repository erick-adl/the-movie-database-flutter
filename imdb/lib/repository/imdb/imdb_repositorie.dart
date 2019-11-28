import 'dart:async';
import 'package:imdb/models/dto/upcoming.dart';
import 'package:imdb/models/dto/genres.dart';
import 'package:imdb/imdb_key.dart';
import 'package:imdb/models/genre.dart';
import 'package:imdb/models/movie.dart';
import 'package:http/http.dart' as http;

var _apiKey = IMDBKey.apiKey;
const BASE_URL = "https://api.themoviedb.org/3/";
const UPCOMING_URL = "movie/upcoming";
const GENRES_URL = "genre/movie/list";
int _page = 1;

class ImdbRepository {
  Future<List<Movie>> getMovieList() async {
    var response =
        await http.get("$BASE_URL$UPCOMING_URL?api_key=$_apiKey&page=$_page");
    if (response.statusCode == 200) {
      _page++;
      return upcomingFromJson(response.body).movies;
    } else
      throw Exception(response.reasonPhrase);
  }

  Future<List<Genre>> getMoviesGenre() async {
    var response = await http.get("$BASE_URL$GENRES_URL?api_key=$_apiKey");
    if (response.statusCode == 200)
      return genresFromJson(response.body).genres;
    else
      throw Exception(response.reasonPhrase);
  }
}
