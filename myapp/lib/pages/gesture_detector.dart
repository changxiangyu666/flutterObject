import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class GestureDetectorRoute extends StatefulWidget {
  @override
  _GestureDetectorRouteState createState() => new _GestureDetectorRouteState();
}

class _GestureDetectorRouteState extends State<GestureDetectorRoute> {
  String _operation = "No Gesture detected!"; //保存事件名

  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            '手势检测（点击、双击、长安）',
            style: Theme.of(context).primaryTextTheme.title,
          ),
        ),
        body: ListView(children: <Widget>[
          Center(
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 200.0,
                height: 100.0,
                child: Text(
                  _operation,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () => updateText("Tap"), //点击
              onDoubleTap: () => updateText("DoubleTap"), //双击
              onLongPress: () => updateText("LongPress"), //长按
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 120.0, right: 120),
            //容器外补白
            constraints: BoxConstraints.tightFor(width: 200.0, height: 100.0),
            //卡片大小
            decoration: BoxDecoration(
                //背景装饰
                gradient: RadialGradient(
                    //背景径向渐变
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: .98),
                boxShadow: [
                  //卡片阴影
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            transform: Matrix4.rotationZ(.2),
            //卡片倾斜变换
            alignment: Alignment.center,
            //卡片内文字居中
            child: FlatButton(
              height: 100,
              minWidth: 200,
              colorBrightness: Brightness.dark,
              splashColor: Colors.orange,
              child: Text("拖动，滑动",
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return _Drag();
                }));
              },
            ),
          ),
          RaisedButton(
            color: Colors.green,
            highlightColor: Colors.green[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("垂直拖动"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return _DragVertical();
              }));
            },
          ),
          RaisedButton(
            color: Colors.lightBlueAccent,
            highlightColor: Colors.lightBlueAccent[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("缩放"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return _ScaleTestRoute();
              }));
            },
          ),
          RaisedButton(
            color: Colors.deepOrangeAccent,
            highlightColor: Colors.deepOrangeAccent[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("GestureRecognizer"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return _GestureRecognizerTestRoute();
              }));
            },
          ),
          RaisedButton(
            color: Colors.indigoAccent,
            highlightColor: Colors.indigoAccent[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("手势竞争"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BothDirectionTestRoute();
              }));
            },
          ),
          RaisedButton(
            color: Colors.indigoAccent,
            highlightColor: Colors.indigoAccent[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("手势冲突"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GestureConflictTestRoute();
              }));
            },
          ),
        ]));
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}

class _DragVertical extends StatefulWidget {
  @override
  _DragVerticalState createState() => new _DragVerticalState();
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //垂直方向拖动事件
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              }),
        )
      ],
    );
  }
}

class _ScaleTestRoute extends StatefulWidget {
  @override
  _ScaleTestRouteState createState() => new _ScaleTestRouteState();
}

class _ScaleTestRouteState extends State<_ScaleTestRoute> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        //指定宽度，高度自适应
        child: Image.asset("assets/images/3.jpg", width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            //缩放倍数在0.8到10倍之间
            _width=200*details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}

class _GestureRecognizerTestRoute extends StatefulWidget {
  @override
  _GestureRecognizerTestRouteState createState() => new _GestureRecognizerTestRouteState();
}

class _GestureRecognizerTestRouteState
    extends State<_GestureRecognizerTestRoute> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
          TextSpan(
              children: [
                TextSpan(text: "你好世界"),
                TextSpan(
                  text: "点我变色",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: _toggle ? Colors.blue : Colors.red
                  ),
                  //TextSpan有一个recognizer属性，它可以接收一个GestureRecognizer
                  recognizer: _tapGestureRecognizer
                    ..onTap = () {
                      setState(() {
                        _toggle = !_toggle;
                      });
                    },
                ),
                TextSpan(text: "你好世界"),
              ]
          )
      ),
    );
  }
}

class BothDirectionTestRoute extends StatefulWidget {
  @override
  BothDirectionTestRouteState createState() =>
      new BothDirectionTestRouteState();
}

class BothDirectionTestRouteState extends State<BothDirectionTestRoute> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          //同时识别水平和垂直方向的拖动手势，当用户按下手指时就会触发竞争（水平方向
          // 和垂直方向），一旦某个方向“获胜”，则直到当次拖动手势结束都会沿着该方向移动
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //垂直方向拖动事件
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top += details.delta.dy;
              });
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _left += details.delta.dx;
              });
            },
          ),
        )
      ],
    );
  }
}

class GestureConflictTestRoute extends StatefulWidget {
  @override
  GestureConflictTestRouteState createState() =>
      new GestureConflictTestRouteState();
}

class GestureConflictTestRouteState extends State<GestureConflictTestRoute> {
  double _left = 0.0;
  double _leftB = 0.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")), //要拖动和点击的widget
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _left += details.delta.dx;
              });
            },
            onHorizontalDragEnd: (details){
              print("onHorizontalDragEnd");
            },
            onTapDown: (details){
              print("down");
            },
            onTapUp: (details){
              print("up");
            },
          ),
        ),

        Positioned(
          top:80.0,
          left: _leftB,
          child: Listener(
            onPointerDown: (details) {
              print("down");
            },
            onPointerUp: (details) {
              //会触发
              print("up");
            },
            child: GestureDetector(
              child: CircleAvatar(child: Text("B")),
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _leftB += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                print("onHorizontalDragEnd");
              },
            ),
          ),
        )
      ],
    );
  }
}