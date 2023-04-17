import 'package:flutter/material.dart';
import 'package:lins_travel/src/partials/citybox.dart';
import 'package:lins_travel/src/partials/customdrawer.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class FavoritesPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (context, appdata, child) {
      List favorites = appdata.favoritesCities();

      return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            titulo: 'Cidades Salvas',
          ),
        ),
        drawer: CustomDrawer(
          pageContext: context,
        ),
        backgroundColor: Colors.white,
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(favorites.length, (index) {
            return CityBox(
              data: favorites[index],
              onTap: (cityData) {
                Navigator.pushNamed(context, '/city', arguments: cityData);
              },
            );
          }),
        ),
      );
    });
  }
}
