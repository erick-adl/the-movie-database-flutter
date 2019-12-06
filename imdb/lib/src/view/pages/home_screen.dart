import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:imdb/src/blocs/movies_bloc.dart';
import 'package:imdb/src/global/colors.dart';
import 'package:imdb/src/view/tiles/movie_list_tile.dart';
import 'package:imdb/src/view/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MoviesBloc>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: MainAppBar(),
      ),
      backgroundColor: colorGrayscale10,
      body: StreamBuilder(
          stream: bloc.movieListControllerOut,
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Container(
                  color: colorGrayscale10,
                  child: new Text(
                    snapshot.error.toString().substring(10),
                    style: TextStyle(fontSize: 20.0, color: colorDarkYellow),
                  ),
                  alignment: Alignment(0.0, 0.0),
                ),
              );
            }
            if (snapshot.hasData)
              return ListView.builder(
                physics: ScrollPhysics(),
                padding: const EdgeInsets.all(2.0),
                itemBuilder: (context, index) {
                  if (index < snapshot.data.length) {
                    return MovieListViewTile(snapshot.data[index]);
                  } else if (index > 1) {
                    bloc.fetchListMovie();
                    return Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.yellow),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
                itemCount: snapshot.data.length + 1,
              );
            else
              return Container();
          }),
    );
  }
}
