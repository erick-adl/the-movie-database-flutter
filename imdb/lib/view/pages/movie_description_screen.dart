import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:imdb/global/colors.dart';
import 'package:imdb/models/movie.dart';
import 'package:imdb/view/widgets/custom_loader.dart';

class MovieDescriptionScreen extends StatelessWidget {
  final Movie movie;
  final imageUrl;

  const MovieDescriptionScreen({Key key, this.movie, this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        child: new Material(
          color: Colors.transparent,
          child: new CustomScrollView(
            slivers: [
              new SliverAppBar(
                centerTitle: true,
                flexibleSpace: new FlexibleSpaceBar(
                  background: AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child: new Container(
                      child: CachedNetworkImage(
                        imageUrl: "http://image.tmdb.org/t/p/w500$imageUrl",
                        placeholder: (context, url) => CustomLoader(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                pinned: false,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                expandedHeight: MediaQuery.of(context).size.height / 3.0,
                backgroundColor: colorGrayscale10,
              ),
              SliverFillRemaining(
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: colorGrayscale10,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "\Title: ${movie.originalTitle}",
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "\nRelease date: ${movie.releaseDate}",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("\n${movie.overview}",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "\nGenres: ${movie.genreNames.reduce((value, element) => value + ' , ' + element)}",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white)),
                            ),
                          ],
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
