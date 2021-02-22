import 'package:flutter/material.dart';
import 'package:myapp/pages/animation.dart';
import 'package:myapp/pages/animation1.dart';
import 'package:myapp/pages/cascade.dart';
import 'package:myapp/pages/container.dart';
import 'package:myapp/pages/custom.dart';
import 'package:myapp/pages/custom_scroll_view.dart';
import 'package:myapp/pages/event_processing.dart';
import 'package:myapp/pages/form.dart';
import 'package:myapp/pages/gesture_detector.dart';
import 'package:myapp/pages/hero.dart';
import 'package:myapp/pages/img_and_icon.dart';
import 'package:myapp/pages/inherited_widget.dart';
import 'package:myapp/pages/input_form.dart';
import 'package:myapp/pages/notification.dart';
import 'package:myapp/pages/radio_check.dart';
import 'package:myapp/pages/scroll_controller.dart';
import 'package:myapp/pages/theme.dart';
import 'package:myapp/pages/turnbox.dart';
import 'package:myapp/pages/will_pop_scope.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new AppBar(
            title: new Text(
              '菜单',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              //GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，
              child: new GridView.count(
                padding: const EdgeInsets.all(10.0),
                // 我们通过它可以快速的创建横轴固定数量子元素的GridView
                crossAxisCount: 3,
                //子元素在横轴长度和主轴长度的比例
                childAspectRatio: 2.0,
                //主轴方向的间距。
                mainAxisSpacing: 5,
                //横轴方向子元素的间距。
                crossAxisSpacing: 5,
                children: <Widget>[
                  //"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
                  RaisedButton(
                    child: Text("图片和Icon"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Img();
                      }));
                    },
                  ),
                  //默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
                  OutlineButton(
                    child: Text(
                      "输入框及表单",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14.0,
                      ),
                    ),
                    highlightedBorderColor: Colors.blue,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return InputAndForm();
                          }));
                    },
                  ),
                  //RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数，通过它可以创建带图标的按钮
                  RaisedButton.icon(
                    icon: Icon(Icons.send),
                    label: Text("login"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return FormTestRoute();
                          }));
                    },
                  ),
                  FlatButton(
                    color: Colors.orangeAccent,
                    highlightColor: Colors.orangeAccent[700],
                    colorBrightness: Brightness.dark,
                    //保证按钮文字颜色为浅色
                    splashColor: Colors.grey,
                    child: Text("层叠布局"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return CascadeRoute();
                          }));
                    },
                  ),
                  //扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
                  FlatButton(
                    child: Text("单选和复选"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return SwitchAndCheckBoxTestRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    color: Colors.brown,
                    highlightColor: Colors.brown[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("容器类"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ContainerRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    child: Text("CustomScrollView"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return CustomScrollViewRoute();
                          }));
                    },
                  ),
                  OutlineButton(
                    child: Text(
                      "滚动监听及控制",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14.0,
                      ),
                    ),
                    highlightedBorderColor: Colors.blue,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ScrollControllerRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    child: Text("返回拦截"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return WillPopScopeTestRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    color: Colors.deepOrange,
                    highlightColor: Colors.deepOrange[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("数据共享"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return InheritedWidgetTestRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    color: Colors.deepOrangeAccent,
                    highlightColor: Colors.deepOrangeAccent[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("主题"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ThemeTestRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    color: Colors.orange,
                    highlightColor: Colors.orange[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("事件处理"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return EventRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    highlightColor: Colors.blueAccent[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("手势识别"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return GestureDetectorRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    color: Colors.lightBlueAccent[400],
                    highlightColor: Colors.lightBlueAccent[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("通知"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return NotificationRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    color: Colors.green,
                    highlightColor: Colors.green[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("手势识别"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return GestureDetectorRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    color: Colors.lightGreen,
                    highlightColor: Colors.lightGreen[700],
                    child: Text("动画"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ScaleAnimationRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    color: Colors.greenAccent,
                    highlightColor: Colors.greenAccent[700],
                    child: Text("Hero动画"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return HeroAnimationRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    color: Colors.yellow,
                    highlightColor: Colors.yellow[700],
                    child: Text("交错动画"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return StaggerDemo();
                          }));
                    },
                  ),
                  RaisedButton(
                    color: Colors.purpleAccent,
                    highlightColor: Colors.purpleAccent[700],
                    child: Text("自定义按钮"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return GradientButtonRoute();
                          }));
                    },
                  ),
                  RaisedButton(
                    color: Colors.deepPurpleAccent,
                    highlightColor: Colors.deepPurpleAccent[700],
                    child: Text("TurnBox"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return TurnBoxRoute();
                          }));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*@required this.onPressed, //按钮点击回调
this.textColor, //按钮文字颜色
this.disabledTextColor, //按钮禁用时的文字颜色
this.color, //按钮背景颜色
this.disabledColor,//按钮禁用时的背景颜色
this.highlightColor, //按钮按下时的背景颜色
this.splashColor, //点击时，水波动画中水波的颜色
this.colorBrightness,//按钮主题，默认是浅色主题
this.padding, //按钮的填充
this.shape, //外形
@required this.child, //按钮的内容*/
