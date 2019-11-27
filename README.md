# imdb

A Flutter application made for IMDb as proof of concept

## Getting Started

1. First you need to install [Flutter](https://flutter.dev/docs/get-started/install) and [Android Studio](https://developer.android.com/studio/install).
2. If you need, install [Xcode](https://developer.apple.com/xcode/) too.
    Clone this repository
    ```
    git clone https://github.com/erick-adl/The-Movie-Database-Flutter.git
    ```
3. Install [VSCode](https://code.visualstudio.com/)

4. install Flutter plugin, then  cmd + shift + p, type Pub: Get Packages.    

5. cmd + shift + p, type Flutter: Run Flutter Doctor, this command will help you to check if your flutter application can run on both android and ios platform.

6. Navigate to lib/imdb_key.dart and change the apiKey "<YOUR_IMDB_API_KEY>" to your own api [key](https://developers.themoviedb.org/3/getting-started/introduction)
7. Run: 
    ```
    flutter packages pub run flutter_launcher_icons:main
    ```
   This command will change the app icons on start, see [flutter_launcher_icons](https://pub.dartlang.org/packages/flutter_launcher_icons)
8. Now you can start the application, first navigate inside imdb/lib folder and open main.dart:

9. To run the application you can press F5 or open your terminal inside imdb/lib folder and type flutter run.

## Libraries
```
dependencies:
  flutter:
    sdk: flutter
  mockito: ^4.1.1
    Used to mock class to test
  http: ^0.12.0
    A composable, Future-based library for making HTTP requests. Used to create requests to imdb api
  rxdart: ^0.20.0
    RxDart is a reactive functional programming library for Google Dart, based on ReactiveX. Used to bloc implementation 
  bloc_pattern: ^1.3.0
    Package that helps you implementing BloC Pattern by Dependency Injection in your project.
  flutter_launcher_icons: ^0.7.4
    A package which simplifies the task of updating your Flutter app's launcher icon.
```

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
"# the-movie-database-flutter" 
