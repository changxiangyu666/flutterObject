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

  //下划线
  Widget divider1=Divider(color: Colors.blue,);
  Widget divider2=Divider(color: Colors.green);
  //表尾标记
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

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

    //比ListView.builder多了一个separatorBuilder参数，该参数是一个分割器生成器
    /*return ListView.separated(
      itemCount: _words.length,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            Future.delayed(Duration(seconds: 2)).then((e) {
              _words.insertAll(_words.length - 1,
                  //每次生成20个单词
                  generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
              );
              setState(() {
                //重新构建列表
              });
            });
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
            );
          }
        }
        return ListTile(
          title: Text(_words[index]),
        );;
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index%2==0?divider1:divider2;
      },
    );*/

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

/*
* ListView({
  ...
  //可滚动widget公共参数
* 滚动方向
  Axis scrollDirection = Axis.vertical,
* 是否按照阅读方向相反的方向滑动
  bool reverse = false,
* ScrollController的主要作用是控制滚动位置和监听滚动事件
  ScrollController controller,
* 是否使用widget树中默认的PrimaryScrollController
  bool primary,
* 决定可滚动Widget如何响应用户操作，默认情况下，Flutter会根据具体平台分别使用不同的
* ScrollPhysics对象，应用不同的显示效果，如当滑动到边界时，继续拖动的话，在iOS上会出
* 现弹性效果，而在Android上会出现微光效果
  ScrollPhysics physics,
  EdgeInsetsGeometry padding,

  //ListView各个构造函数的共同参数
* itemExtent：该参数如果不为null，则会强制children的”长度”为itemExtent的值；这里的
* ”长度”是指滚动方向上子widget的长度，即如果滚动方向是垂直方向，则itemExtent代表子
* widget的高度，如果滚动方向为水平方向，则itemExtent代表子widget的长度。在ListView
* 中，指定itemExtent比让子widget自己决定自身长度会更高效
  double itemExtent,
* shrinkWrap：该属性表示是否根据子widget的总长度来设置ListView的长度，默认值为false。
* 默认情况下，ListView的会在滚动方向尽可能多的占用空间。当ListView在一个无边界
* (滚动方向上)的容器中时，shrinkWrap必须为true
  bool shrinkWrap = false,
* addAutomaticKeepAlives：该属性表示是否将列表项（子widget）包裹在AutomaticKeepAlive
*  widget中；典型地，在一个懒加载列表中，如果将列表项包裹在AutomaticKeepAlive中，在该
* 列表项滑出视口时该列表项不会被GC，它会使用KeepAliveNotification来保存其状态。如果列
* 表项自己维护其KeepAlive状态，那么此参数必须置为false
  bool addAutomaticKeepAlives = true,
* addRepaintBoundaries：该属性表示是否将列表项（子widget）包裹在RepaintBoundary中。
* 当可滚动widget滚动时，将列表项包裹在RepaintBoundary中可以避免列表项重绘，但是当列表
* 项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，不添加RepaintBoundary反而
* 会更高效。和addAutomaticKeepAlive一样，如果列表项自己维护其KeepAlive状态，那么此参
* 数必须置为false
  bool addRepaintBoundaries = true,
  double cacheExtent,

  //子widget列表
  List<Widget> children = const <Widget>[],
})
* */

/*
*默认构造函数有一个children参数，它接受一个Widget列表（List）。这种方式适合只有少量的
* 子widget的情况，因为这种方式需要将所有children都提前创建好（这需要做大量工作），而
* 不是等到子widget真正显示的时候再创建
*
*ListView(
  shrinkWrap: true,
  padding: const EdgeInsets.all(20.0),
  children: <Widget>[
    const Text('I\'m dedicating every day to you'),
    const Text('Domestic life was never quite my style'),
  ],
);
* */

/*
*ListView.builder适合列表项比较多（或者无限）的情况，因为只有当子Widget真正显示的时候
* 才会被创建
*
*ListView.builder({
  // ListView公共参数已省略
  ...
* temBuilder：它是列表项的构建器，类型为IndexedWidgetBuilder，返回值为一个widget。
* 当列表滚动到具体的index位置时，会调用该构建器构建列表项。
  @required IndexedWidgetBuilder itemBuilder,
* temCount：列表项的数量，如果为null，则为无限列表
  int itemCount,
  ...
})
* */