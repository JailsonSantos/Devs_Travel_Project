import 'package:flutter/material.dart';
import 'package:lins_travel/src/partials/citybox.dart';
import 'package:lins_travel/src/partials/customdrawer.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class ContinentPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // ignore: prefer_const_constructors
  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue',
  );

  void seeCityAction(context, continentIndex) {
    Navigator.pushNamed(context, '/listcity', arguments: continentIndex);
  }

  void cityBoxAction(pageContext, cityData) {
    Navigator.pushNamed(pageContext, '/city', arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (context, appdata, child) => Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: CustomAppBar(
              scaffoldKey: _scaffoldKey,
              pageContext: context,
              titulo: 'Escolha um continente',
            ),
          ),
          drawer: CustomDrawer(
            pageContext: context,
          ),
          backgroundColor: Colors.white,
          body: ListView.builder(
            itemCount: appdata.data.length,
            itemBuilder: (context, index) {
              var cities = [];

              for (var country in appdata.data[index]['countries']) {
                cities.addAll(country['cities']);
              }

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          "${appdata.data[index]['name']} (${cities.length})",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica Neue',
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            side: const BorderSide(
                              width: 1.0,
                              color: Colors.white,
                            )),
                        child: Text(
                          'Ver cidades',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica Neue',
                            color: Colors.grey,
                          ),
                        ),
                        onPressed: () {
                          seeCityAction(context, index);
                        },
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 15),
                      height: 160,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cities.length,
                          itemBuilder: (cityContext, cityIndex) {
                            return CityBox(
                              data: cities[cityIndex],
                              onTap: (cityData) {
                                cityBoxAction(context, cityData);
                              },
                            );
                          }))
                ],
              );
            },
          )),
    );
  }
}
