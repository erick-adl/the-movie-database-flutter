import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imdb/models/movie.dart';

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
                title: Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                flexibleSpace: new FlexibleSpaceBar(
                  background: new Stack(
                    children: [
                      Positioned.fill(
                        child: Hero(
                          tag: movie.originalTitle,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                "http://image.tmdb.org/t/p/w500$imageUrl",
                              ),
                            )),
                            child: new BackdropFilter(
                              filter: new ImageFilter.blur(
                                  sigmaX: 0.1, sigmaY: 0.1),
                              child: new Container(
                                decoration: new BoxDecoration(
                                    color: Colors.white.withOpacity(0.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                backgroundColor: Colors.white,
              ),
              SliverFillRemaining(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Color(0xeFF2a2a2e),
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
                              child: Text("\nRelease date: ${movie.releaseDate}",
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
