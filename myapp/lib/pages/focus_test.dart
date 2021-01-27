import 'package:flutter/material.dart';

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            '焦点控制',
            style: Theme.of(context).primaryTextTheme.title,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode1, //关联focusNode1
                decoration: InputDecoration(labelText: "input1"),
              ),
              TextField(
                focusNode: focusNode2, //关联focusNode2
                decoration: InputDecoration(labelText: "input2"),
              ),
              Builder(
                builder: (ctx) {
                  return Column(
                    children: <Widget>[
                      RaisedButton(
                        child: Text("移动焦点"),
                        onPressed: () {
                          //将焦点从第一个TextField移到第二个TextField
                          // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                          // 这是第二种写法
                          if (null == focusScopeNode) {
                            //FocusScope.of(context) 来获取widget树中默认的FocusScopeNode
                            focusScopeNode = FocusScope.of(context);
                          }
                          focusScopeNode.requestFocus(focusNode2);
                        },
                      ),
                      RaisedButton(
                        child: Text("隐藏键盘"),
                        onPressed: () {
                          // 当所有编辑框都失去焦点时键盘就会收起
                          focusNode1.unfocus();
                          focusNode2.unfocus();
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ));
  }
}

/*
* Padding({
  ...
* EdgeInsetsGeometry是一个抽象类，开发中，我们一般都使用EdgeInsets，
* 它是EdgeInsetsGeometry的一个子类，定义了一些设置补白的便捷方法
* EdgeInsets提供的便捷方法：
*   fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的补白。
*   all(double value) : 所有方向均使用相同数值的补白。
*   only({left, top, right ,bottom })：可以设置具体某个方向的补白(可以同时指定多个方向)。
*   symmetric({ vertical, horizontal })：用于设置对称方向的补白，vertical指top和bottom，horizontal指left和right。
  EdgeInsetsGeometry padding,
  Widget child,
})
*
* */