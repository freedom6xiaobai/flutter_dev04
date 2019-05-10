import 'package:flutter/material.dart';

//1.喜欢按钮 MyLikeButton
//2.手势按钮 MyButton

//根据状态编号喜欢按钮总数，自定义控件 我的喜欢♥️

class MyLikeButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyLikeButtonState();
  }
}

class MyLikeButtonState extends State<MyLikeButton> {
  int _numCount = 0;//个数
  bool _isClick = false;

  void _btnAction(){//按钮点击事件
    setState(() {
      _isClick = !_isClick;
      if(_isClick){
        _numCount++;
      }else{
        _numCount--;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            color: Colors.red,
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.only(left: 100),
            width: 40.0,
            height: 40.0,
            child: Text(
              '喜欢',
              style: TextStyle(
                  //文字样式，斜体和正常
                  fontSize: 18.0,
                  //字体大小
                  fontWeight: FontWeight.w900,
                  //字体粗细  粗体和正常
                  color: Colors.black ////文字颜色
                  ),
              textAlign: TextAlign.right,
            ),
            alignment: Alignment(0, 0)
        ),
        Container(
          color: Colors.yellow,
          margin: EdgeInsets.symmetric(vertical: 100),
          padding: EdgeInsets.all(0),
          width: 40.0,
          height: 40.0,
          child: IconButton(
              icon: _isClick ? Icon(Icons.star) : Icon(Icons.star_border),
              onPressed:_btnAction
          ),
        ),
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: Container(
            alignment: Alignment(0.0, 0.0),
            color: Colors.grey,
            child: Text('$_numCount'),
          ),
        )
      ],
    );
  }
}

//按钮1
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        print('MyButton to Tap');
      },
      child: Container(
        height: 30.0,
        margin: EdgeInsets.symmetric(horizontal: 2.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.lightBlue[500]),
        child: Center(
          child: Text('Hello'),
        ),
      ),
    );
  }
}

//按钮2
class MyButton1 extends StatelessWidget{
  MyButton1(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 40.0,
//      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.yellow
      ),
      child: RaisedButton(onPressed: null,child: Text(title),),
    );
  }
}