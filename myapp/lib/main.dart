import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:myapp/views/contact.dart';
import 'package:myapp/views/found.dart';
import 'package:myapp/views/member.dart';
import 'package:myapp/views/weixin.dart';
import './route/route.dart';
import 'homePage.dart';
import 'login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  //widget的主要工作是提供一个build()方法来描述如何根据其他较低级别的widget来显示自己
  Widget build(BuildContext context) {
    return new MaterialApp(
      /*title: 'Welcome to Flutter',
      // Scaffold 是 Material library 中提供的一个widget,
      // 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          // child: new Text('Hello World'),
          // child: new Text(wordPair.asPascalCase),//1.
          child: new RandomWords(),//2.有状态的部件（Stateful widget）
        ),
      ),*/
      //3.
      title: 'Startup Name Generator',
      initialRoute:"/", //8.名为"/"的路由作为应用的home(首页)
      //7.更改应用程序的主题
      theme: new ThemeData(
        primaryColor: Colors.teal,
      ),
      //8.注册路由表
      routes:{
        "/":(context)=> new LoginScreen(),
        "/home":(context)=> new Fotter(),
        "menu":(context)=> HomeRoute(),
      } ,
    );
  }
}

class Fotter extends StatefulWidget{
  @override
  //2.创建State类
  State<StatefulWidget> createState() => new FotterState();
}
class FotterState extends State<Fotter>{
  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble),
        title: Text('微信')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.group),
        title: Text('通讯录')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.directions),
        title: Text('发现')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        title: Text('我的')
    )
  ];

  int _currentIndex = 0;

  List<Widget> _pages = [
    RandomWords(),
    FoundPage(),
    MemberPage(),
    ContactPage()
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      //底部导航栏，也就是tab栏
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _items,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

