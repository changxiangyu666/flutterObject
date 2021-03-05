import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  static BuildContext context1;
  Widget loginButton = new Container(
      margin: const EdgeInsets.all(35),
      //这个widget距离父控件左右35（还有个all就是距离左上右下四个方向）
      child: new SizedBox(
        //用来设置宽高，如直接使用RaisedButton则不能设置
          height: 40,
          child: new RaisedButton(
            //一个凸起的材质矩形按钮
              color: Color(0xff3CB964),
              child: new Text(
                '退出',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: () {
                showDialog(
                  context: context1,
                  barrierDismissible: true, //点击弹窗外部是否消失
                  child: CupertinoAlertDialog(
                    title: Text('提示',
                      style: new TextStyle(color: Color(0xFF666666), fontSize: 16),
                    ),
                    content: Text('\n您确定要退出应用程序吗',
                      style: new TextStyle(color: Color(0xFF999999), fontSize: 14),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('确认',style: TextStyle(color: Color(0xFF999999)),),
                        onPressed: () {
                          Navigator.of(context1).pushNamed('/');
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text('取消',style: TextStyle(color: Color(0xFF576B95)),),
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.of(context1).pop();
                        },
                      ),
                    ],
                  ),
                );
              }
          )
      )
  );
  @override
  Widget build(BuildContext context) {
    context1 = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        elevation: 0.0,
      ),
      body: ListView(children: <Widget>[
        loginButton,
      ]),
    );
  }

}
