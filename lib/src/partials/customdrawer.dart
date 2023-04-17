import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  BuildContext pageContext;

  CustomDrawer({super.key, required this.pageContext});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LinsTravel',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica Neue'),
                ),
                Text(
                  'Versão 1.0',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Helvetica Neue'),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.public,
              color: Colors.black,
            ),
            title: Text('Escolher Continente'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/continent');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.search,
              color: Colors.black,
            ),
            title: Text('Buscar Cidades'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/search');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            title: Text('Cidades Salvas'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/favorites');
            },
          ),
        ],
      ),
    );
  }
}
