import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:imdb/blocs/movies_bloc.dart';
import 'package:imdb/global/colors.dart';

class MainAppBar extends StatefulWidget {
  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MoviesBloc>(context);

    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      leading: null,
      actions: <Widget>[
        new Padding(
          padding: EdgeInsets.all(10),
          child: new Text(
            "IMDb",
            style: TextStyle(
              color: colorDarkYellow,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              letterSpacing: 3.0,
            ),
          ),
        ),
        new Flexible(
          child: Container(
            padding: EdgeInsets.all(5),
            child: TextField(
              // onChanged: (a) async {
              //   String result =
              //       await showSearch(context: context, delegate: DataSearch());
              //   if (result != null) bloc.inSearch.add(result);
              // },
              autofocus: false,
              decoration: InputDecoration(
                suffixIcon: new Icon(Icons.search, color: colorDarkYellow),
                hintText: "Find movies..",
                border: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderSide: new BorderSide(color: colorDarkYellow),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                hintStyle: TextStyle(color: colorDarkYellow),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.blue)),
                contentPadding: EdgeInsets.only(bottom: 20.0, left: 10.0),
              ),
              style: TextStyle(
                color: colorWhite,
                fontSize: 16.0,
              ),
              // onChanged: _updateSearchQuery,
            ),
          ),
        ),
      ],
      backgroundColor: colorGrayscale10,
    );
  }
}
