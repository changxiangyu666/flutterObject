import 'package:flutter/material.dart';
import 'package:myapp/pages/img_and_icon.dart';

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
                  //扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
                  FlatButton(
                    child: Text("normal"),
                    onPressed: () {},
                  ),
                  //默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
                  OutlineButton(
                    child: Text(
                      "normal",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.0,
                      ),
                    ),
                    highlightedBorderColor: Colors.blue,
                    onPressed: () {},
                  ),
                  //RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数，通过它可以创建带图标的按钮
                  RaisedButton.icon(
                    icon: Icon(Icons.send),
                    label: Text("发送"),
                    onPressed: () {},
                  ),
                  FlatButton(
                    color: Colors.orangeAccent,
                    highlightColor: Colors.orangeAccent[700],
                    colorBrightness: Brightness.dark,
                    //保证按钮文字颜色为浅色
                    splashColor: Colors.grey,
                    child: Text("Submit"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    color: Colors.brown,
                    highlightColor: Colors.brown[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("Submit"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {},
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
