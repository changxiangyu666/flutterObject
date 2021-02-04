import 'package:flutter/material.dart';

/*
* Listener({
  Key key,
  this.onPointerDown, //手指按下回调
  this.onPointerMove, //手指移动回调
  this.onPointerUp,//手指抬起回调
  this.onPointerCancel,//触摸事件取消回调
  this.behavior = HitTestBehavior.deferToChild, //在命中测试期间如何表现
  Widget child
})
* */

class EventRoute extends StatefulWidget{
  @override
  _EventRouteState  createState() => new _EventRouteState();
}

class _EventRouteState extends State<EventRoute>{
  @override
  Widget build(BuildContext context) {
    //定义一个状态，保存当前指针位置
    PointerEvent _event;
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          '原始指针处理事件',
          style: Theme.of(context).primaryTextTheme.title,
        ),
      ),
      body:ListView(
        children: <Widget>[
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 300.0,
              height: 150.0,
              child: Text(_event?.toString()??"",style: TextStyle(color: Colors.white)),
            ),
            onPointerDown: (PointerDownEvent event) => setState(()=>_event=event),
            onPointerMove: (PointerMoveEvent event) => setState(()=>_event=event),
            onPointerUp: (PointerUpEvent event) => setState(()=>_event=event),
          ),
          Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                child: Center(child: Text("Box A")),
              ),
              // behavior: HitTestBehavior.opaque,
              onPointerDown: (event) => print("down A")
          ),
          Stack(
            children: <Widget>[
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue)),
                ),
                onPointerDown: (event) => print("down0"),
              ),
              Listener(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                  child: Center(child: Text("左上角200*100范围内非文本区域点击")),
                ),
                onPointerDown: (event) => print("down1"),
                behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
              )
            ],
          ),
          Listener(
            //由于它在AbsorbPointer的子树上，所以不会响应指针事件，所以日志不会输出
            // ”in”，但AbsorbPointer本身是可以接收指针事件的，所以会输出”up”。如果
            // 将AbsorbPointer换成IgnorePointer，那么两个都不会输出
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event)=>print("in"),
              ),
            ),
            onPointerDown: (event)=>print("up"),
          )
        ],
      )
    );
  }
}

/*
*PointerEvent一些常用属性
*
*
    position：它是鼠标相对于当对于全局坐标的偏移。
    delta：两次指针移动事件（PointerMoveEvent）的距离。
    pressure：按压力度，如果手机屏幕支持压力传感器(如iPhone的3D Touch)，此属性会更有意义，如果手机不支持，则始终为1。
    orientation：指针移动方向，是一个角度值。

*
* */

/*
*behavior属性，它决定子Widget如何响应命中测试，它的值类型为HitTestBehavior，这是一个
* 枚举类，有三个枚举值
*
* deferToChild：子widget会一个接一个的进行命中测试，如果子Widget中有测试通过的，则当
* 前Widget通过，这就意味着，如果指针事件作用于子Widget上时，其父(祖先)Widget也肯定可
* 以收到该事件。
* opaque：在命中测试时，将当前Widget当成不透明处理(即使本身是透明的)，最终的效果相当
* 于当前Widget的整个区域都是点击区域。
* translucent：当点击Widget透明区域时，可以对自身边界内及底部可视区域都进行命中测试，
* 这意味着点击顶部widget透明区域时，顶部widget和底部widget都可以接收到事件
* */