import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        elevation: 0.0,
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text('退出登录'),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/'); //跳转到main.dart对routeName（'/'）的界面
            }),
      ),
    );
  }
}
