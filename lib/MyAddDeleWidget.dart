import 'package:flutter/material.dart';

/*动态添加按钮*/

class addDeleteControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return addDeleteControlState();
  }
}

class addDeleteControlState extends State<addDeleteControl> {
  bool _isClick = true;

  void _updateAction(){
    setState(() {
      _isClick = !_isClick;
    });
  }

  //动态添加按钮
  Widget _getControlChild(){
    if(_isClick){
      return Text('点击了');
    }else{
      return IconButton(icon: Icon(Icons.format_shapes),tooltip: '新按钮', onPressed: (){
        print('ddd');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 10.0,
          height: 10.0,
          color: Colors.red,
        ),
        IconButton(icon: Icon(Icons.ac_unit),tooltip: '更新文案', onPressed: _updateAction),
        _getControlChild()
      ],
    );
  }
}
