import 'package:flutter/material.dart';
import 'package:lins_travel/src/pages/city.dart';
import 'package:lins_travel/src/pages/continent.dart';
import 'package:lins_travel/src/pages/favorites.dart';
import 'package:lins_travel/src/pages/listcity.dart';
import 'package:lins_travel/src/pages/preload.dart';
import 'package:lins_travel/src/pages/search.dart';
import 'package:provider/provider.dart';

import 'package:lins_travel/src/pages/home.dart';
import 'package:lins_travel/src/models/appdata.dart';

//  ? Barra e Interrogação

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppData(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/preload',
      routes: {
        '/preload': (context) => LoadingPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/continent': (context) => ContinentPage(),
        '/listcity': (context) => ListCityPage(),
        '/city': (context) => CityPage(),
        '/favorites': (context) => FavoritesPage(),
      },
    );
  }
}
