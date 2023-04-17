import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget {
  final String titulo;
  final bool hideSearch;
  final bool showBack;
  BuildContext pageContext;
  GlobalKey<ScaffoldState> scaffoldKey;

  CustomAppBar({
    super.key,
    this.titulo = '',
    this.hideSearch = false,
    this.showBack = false,
    required this.scaffoldKey,
    required this.pageContext,
  });

  void searchAction() {
    Navigator.pushReplacementNamed(pageContext, '/search');
  }

/*   IconButton drawerIcon = IconButton(
      icon: Icon(Icons.menu, color: Colors.black, size: 30),
      onPressed: () {
        //scaffoldKey.currentState.openDrawer();
      });

  IconButton backIcon = IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
      onPressed: () {});
 */
  @override
  Widget build(BuildContext context) {
    // IconButton leadingButton = drawerIcon;

    /*    if (showBack) {
      leadingButton = backIcon;
    }
 */
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.white,
      title: Text(
        titulo,
        style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Helvetica Neue'),
      ),
      leading: showBack
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
              onPressed: () {
                Navigator.pop(pageContext);
              })
          : IconButton(
              icon: Icon(Icons.menu, color: Colors.black, size: 30),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              }),
      actions: [
        !hideSearch
            ? IconButton(
                icon: const Icon(Icons.search, color: Colors.black, size: 30),
                onPressed: searchAction,
              )
            : Container(),
      ],
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
