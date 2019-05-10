import 'package:flutter/material.dart';

//1.自定义控件，封装矩形Container 及相关属性

//Container的源码本身并不复杂，复杂的是它的各种布局表现。我们谨记住一点，如果内部不设置约束，则按照父节点尽可能的扩大，如果内部有约束，则按照内部来。

/*
一般情况下，Container会遵循如下顺序去尝试布局：
1。对齐（alignment）；
2。调节自身尺寸适合子节点；
3。采用width、height以及constraints布局；
4。扩展自身去适应父节点；
5。调节自身到足够小。
进一步说：
如果没有子节点、没有设置width、height以及constraints，并且父节点没有设置unbounded的限制，Container会将自身调整到足够小。
如果没有子节点、对齐方式（alignment），但是提供了width、height或者constraints，那么Container会根据自身以及父节点的限制，将自身调节到足够小。
如果没有子节点、width、height、constraints以及alignment，但是父节点提供了bounded限制，那么Container会按照父节点的限制，将自身调整到足够大。
如果有alignment，父节点提供了unbounded限制，那么Container将会调节自身尺寸来包住child；
如果有alignment，并且父节点提供了bounded限制，那么Container会将自身调整的足够大（在父节点的范围内），然后将child根据alignment调整位置；
含有child，但是没有width、height、constraints以及alignment，Container会将父节点的constraints传递给child，并且根据child调整自身。
另外，margin以及padding属性也会影响到布局。

 */

//2. 继承关系
//Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > Container
//从继承关系可以看出，Container是一个StatelessWidget。Container并不是一个最基础的widget，它是由一系列的基础widget组合而成。

//3.源码解析，构造函数：Container({Key key,... })
// 平时使用最多的，也就是padding、color、width、height、margin属性。
// 属性解析
//key：Container唯一标识符，用于查找更新。
//alignment：控制child的对齐方式，如果container或者container父节点尺寸大于child的尺寸，这个属性设置会起作用，有很多种对齐方式。
//padding：decoration内部的空白区域，如果有child的话，child位于padding内部。padding与margin的不同之处在于，padding是包含在content内，而margin则是外部边界，设置点击事件的话，padding区域会响应，而margin区域不会响应。
//color：用来设置container背景色，如果foregroundDecoration设置的话，可能会遮盖color效果。
//decoration：绘制在child后面的装饰，设置了decoration的话，就不能设置color属性，否则会报错，此时应该在decoration中进行颜色的设置。
//foregroundDecoration：绘制在child前面的装饰。
//width：container的宽度，设置为double.infinity可以强制在宽度上撑满，不设置，则根据child和父节点两者一起布局。
//height：container的高度，设置为double.infinity可以强制在高度上撑满。
//constraints：添加到child上额外的约束条件。
//margin：围绕在decoration和child之外的空白区域，不属于内容区域。
//transform：设置container的变换矩阵，类型为Matri0x4。
//child：container中的内容widget。

class MyContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyContainerState();
  }
}
class MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
//      color: Colors.red,//背景色
      child: Text('11这是一个矩形这是一个矩形这是一个矩形这是一个矩形这是一个矩形这是一个矩形11',
        textAlign: TextAlign.left,//设置文字居中
//        style: TextStyle(color: Colors.white,fontSize: 18.0),
        style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white,fontSize: 18.0),
        textDirection: TextDirection.rtl,
        maxLines: 3,
      ),//显示内容
      constraints: BoxConstraints.expand(//额外的约束条件。
        height: Theme.of(context).textTheme.display1.fontSize *1.0 * 3 + 100.0,
      ),
      decoration: BoxDecoration(//设置子控件背后的装饰
        border: Border.all(width: 10.0,color: Colors.green),
        color: Colors.red,////和Container下面的color会冲突 具体原因不详
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: <BoxShadow>[//阴影数组,多重颜色层
          BoxShadow(
            blurRadius: 20.0,//阴影大小
            color: Colors.yellow//阴影颜色
          ),
          BoxShadow(
            blurRadius: 10.0,
            color: Colors.red
          )
        ],
        image: DecorationImage(
            image: NetworkImage('http://39.97.185.135/Images/beautiful.jpg'),
            fit: BoxFit.fill,
            //centerSlice: Rect.fromLTRB(0, 0, 0, 0)//显示大小大于原图大小的情况
        )
      ),
      width: 200.0,//宽
      height: 200.0,//高度,添加constraints会导致height失效
      padding: const EdgeInsets.all(5.0),//设置子控件padding (上左右)内边距
      alignment: Alignment(-1.0, -1.0),//设置子控件的位置 子控件位于矩形中心点centerX/Y
      margin: EdgeInsets.all(10.0),//设置矩形控件margin (左右)外边距
//      transform: Matrix4.rotationZ(0.3),

    );
  }
}


/*
需要设置间隔（这种情况下，如果只是单纯的间隔，也可以通过Padding来实现）；
需要设置背景色；
需要设置圆角或者边框的时候（ClipRRect也可以实现圆角效果）；
需要对齐（Align也可以实现）；
需要设置背景图片的时候（也可以使用Stack实现）。
 */