import 'package:flutter/material.dart';

/*自定义bar*/

class MyNavigationBar extends StatelessWidget {
  MyNavigationBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Container(
      height: 64.0,
      padding:
          const EdgeInsets.only(left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
      decoration: BoxDecoration(
        color: Colors.blue[500],
      ),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation Menu',
              onPressed: null),
          Expanded(child: title),
          IconButton(
              icon: Icon(Icons.search), tooltip: 'Search', onPressed: null)
        ],
      ),
    );
  }
}
