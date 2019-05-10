import 'package:flutter/material.dart';
import 'MyContainer.dart';
import 'MyLikeButton.dart';
import 'MyGetures.dart';
import 'MyAddDeleWidget.dart';
import 'MyAnamation.dart';
import 'MyGrphics.dart';

void main() => runApp(MyApp());
//void main() {
//  runApp(MaterialApp(
//    theme: ThemeData(primaryColor: Colors.yellow),
//    home: MyApp(),
//  ));
//}

class MyApp extends StatelessWidget {
  final String title = "自定义控件";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: this.title,
      theme: ThemeData(primaryColor: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Text('Hello word'),
      ),
    );

    
    
    /*
        body: Signature(),
        body: MyAnamation(),
        body: MyLikeButton(),
        body: addDeleteControl(),
        body: MyContainer(),
        body: ParentWidget(),
        body: Center(
            child: MyButton1(title)
          )
     */
    //自定义导航条
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
            icon: Icon(Icons.menu), tooltip: 'Menu', onPressed: null),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Colors.red, fontSize: 16.0),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search), tooltip: 'search', onPressed: null)
        ],
      ),
      body: Center(
        child: Text('Hello word'),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: '加', child: Icon(Icons.add), onPressed: null),
    );
  }
}
