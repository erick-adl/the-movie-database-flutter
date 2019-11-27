import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:imdb/view/pages/home_screen.dart';

import 'blocs/movies_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: MoviesBloc(),
      child: MaterialApp(
        title: 'Imdb',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
