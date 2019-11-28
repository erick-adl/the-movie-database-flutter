import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:imdb/src/global/colors.dart';
import 'package:imdb/src/models/movie.dart';
import 'package:imdb/src/view/pages/movie_description_screen.dart';
import 'package:imdb/src/view/widgets/custom_loader.dart';

class MovieListViewTile extends StatelessWidget {
  MovieListViewTile(this.movieLists);

  final Movie movieLists;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: new Row(
            children: <Widget>[_DetailedInfo(movieLists)],
          ),
        )
      ],
    );
  }
}

class _DetailedInfo extends StatelessWidget {
  _DetailedInfo(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final isImageBroken =
        movie.backdropPath != "null" ? movie.backdropPath : movie.posterPath;
    return Expanded(
      child: InkWell(
        splashColor: Color(0xFF38383d),
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (BuildContext context) => MovieDescriptionScreen(
                    movie: movie,
                    imageUrl: isImageBroken,
                  )));
        },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          child: new Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: colorBlackGradient92,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildAspectRatioMovieImage(isImageBroken),
                  buildMovieTitle(),
                  buildMovieReleaseDate(),
                  buildMovieGenre()
                ],
              )),
        ),
      ),
    );
  }

  Padding buildMovieGenre() {
    return new Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 5),
        child: new Text(
          movie.genreNames.reduce((value, element) => value + ' , ' + element),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: colorBlack, fontWeight: FontWeight.w700),
        ));
  }

  AspectRatio buildAspectRatioMovieImage(String isImageBroken) {
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: new ClipRRect(
        borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0)),
        child: CachedNetworkImage(
          imageUrl: "https://image.tmdb.org/t/p/w500$isImageBroken",
          placeholder: (context, url) => CustomLoader(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }

  Padding buildMovieTitle() {
    return new Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: colorBlack, fontWeight: FontWeight.w700),
            ),
          ],
        ));
  }

  Padding buildMovieReleaseDate() {
    return new Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Icon(
                Icons.event_note,
                size: 16.0,
                color: colorBlack,
              ),
            ),
            new Text(
              movie.releaseDate,
            ),
          ],
        ));
  }
}
