import 'package:flutter/material.dart';
import 'package:lins_travel/src/partials/citybox.dart';
import 'package:lins_travel/src/partials/customdrawer.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  var list = [];

  void doSearch(pageContext, text) async {
    var newList =
        await Provider.of<AppData>(pageContext, listen: false).searchCity(text);

    setState(() {
      list = newList;
    });
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
            titulo: 'Busque uma cidade',
            hideSearch: true,
          ),
        ),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                onChanged: (text) {
                  doSearch(context, text);
                },
                decoration: InputDecoration(
                  hintText: 'Digite o nome de uma cidade.',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search, size: 32),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(list.length, (index) {
                  return CityBox(
                    data: list[index],
                    onTap: (cityData) {
                      Navigator.pushNamed(context, '/city',
                          arguments: cityData);
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
