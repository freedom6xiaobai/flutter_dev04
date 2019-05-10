import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

//动画效果 ，渐隐渐显
//在Flutter中，使用动画库来包裹 widgets，而不是创建一个动画 widget。
//在 Flutter 中，使用 AnimationController 来控制动画暂停、寻找、停止、反转动画等。
//使用Animation类的扩展例如CurvedAnimation 来实现一个 interpolated 曲线。

class MyAnamation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAnamationState();
  }
}

class MyAnamationState extends State<MyAnamation>
    with TickerProviderStateMixin {
  CurvedAnimation curve; //动画库
  AnimationController controller; //动画vc

  //动画事件
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            child: FadeTransition(opacity: curve,child: Container(width: 100,height: 100,color: Colors.red,),),
          ),
          IconButton(
              icon: Icon(Icons.room_service),
              tooltip: '点击',
              onPressed: () {
                controller.forward();
              }),
          Container(
            child: FadeTransition(
                opacity: curve,
                child: FlutterLogo(
                  size: 100.0,
                )),
          ),
        ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
