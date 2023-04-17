import 'package:flutter/material.dart';
import 'package:lins_travel/src/partials/citybox.dart';
import 'package:lins_travel/src/partials/customdrawer.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class ListCityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );

  void cityBoxAction(pageContext, cityData) {
    Navigator.pushNamed(pageContext, '/city', arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    var continentIndex;

    if (context != null) {
      continentIndex = ModalRoute.of(context)?.settings.arguments;
    }
    return Consumer<AppData>(builder: (context, appdata, child) {
      var cities = [];

      for (var country in appdata.data[continentIndex]['countries']) {
        cities.addAll(country['cities']);
      }

      return Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: CustomAppBar(
              scaffoldKey: _scaffoldKey,
              pageContext: context,
              titulo:
                  "${appdata.data[continentIndex]['name']} (${cities.length} cidades)",
              showBack: true,
            ),
          ),
          drawer: CustomDrawer(
            pageContext: context,
          ),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(cities.length, (index) {
              return CityBox(
                data: cities[index],
                onTap: (cityData) {
                  cityBoxAction(context, cityData);
                },
              );
            }),
          ));
    });
  }
}
