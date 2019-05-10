import 'package:flutter/material.dart';

/*手势控件*/

//自定义动态控件
//---------------------------- ParentWidget ----------------------------

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
//  bool _active = false;
//
//  void _handleTapboxChanged(bool newValue) {
//    setState(() {
//      _active = newValue;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
//        active: _active,
//        onChanged: _handleTapboxChanged,
          ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
//  TapboxC({Key key, this.active: false, @required this.onChanged})
//      : super(key: key);

//  final bool active;
//  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;
  bool _active = false;

  void _handleTapDown(TapDownDetails details) {
    print("_handleTapDown");
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    print("_handleTapUp");
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    print("_handleTapCancel");
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    print("_handleTap");
    _active = !_active;
//    widget.onChanged(!widget.active);
  }

  Widget build(BuildContext context) {
    return GestureDetector(//手势类，上下左右/点击 手势事件
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(_active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
