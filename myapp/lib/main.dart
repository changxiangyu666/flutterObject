import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './route/route.dart';
import 'homePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  //widget的主要工作是提供一个build()方法来描述如何根据其他较低级别的widget来显示自己
  Widget build(BuildContext context) {
    /*//1.使用 English words 包生成文本来替换字符串“Hello World”.
    final wordPair =new WordPair.random();*/
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
        primaryColor: Colors.green,
      ),
      //8.注册路由表
      routes:{
        "/":(context)=> new RandomWords(),
        "menu":(context)=> HomeRoute(),
      } ,
      // home: new RandomWords(),
    );
  }
}

//2.创建一个 StatefulWidget类
class RandomWords extends StatefulWidget {
  @override
  //2.创建State类
  createState() => new RandomWordsState();
}

//2.该类持有RandomWords widget的状态
class RandomWordsState extends State<RandomWords> {
  //2.添加一个私有的列表以保存单词对
  final _suggestions = <WordPair>[];
  //4.添加一个私有的Set(集合)，存储用户喜欢（收藏）的单词对（Set中不允许重复的值）
  final _saved = new Set<WordPair>();
  //2.添加一个私有的变量增大字体
  final _biggerFont = const TextStyle(fontSize: 18.0);

  //3.构建显示单词对的ListView方法
  Widget _buildSuggestions(){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），
          // 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  //3.该函数在ListTile中显示每个新词对
  Widget _buildRow(WordPair pair) {
    //4.检查确保单词对还没有添加到收藏夹中
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      //4.添加一个心形图标
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      //4.添加交互
      onTap: (){
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  //2.build方法通过将生成单词对的代码从MyApp移动到RandomWordsState来生成单词对
  Widget build(BuildContext context) {
    /* //2.使用 English words 包生成文本来替换字符串“Hello World”
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);*/

    //3.
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        centerTitle: true,
        //标题栏左侧按钮
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: '菜单',
          onPressed: () {
            Navigator.pushNamed(context, "menu");
          },
        ),
        //5.添加一个列表图标。当用户点击列表图标时，包含收藏夹的新路由页面入栈显示
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  //5.建立一个路由并将其推入到导航管理器栈中。此操作会切换页面以显示新路由
  void _pushSaved() {
    //5.使路由入栈
    Navigator.of(context).push(
      new MaterialPageRoute(
        //builder 是一个WidgetBuilder类型的回调函数，
        // 它的作用是构建路由页面的具体内容，返回值是一个widget
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles,
            )
            .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }
}

