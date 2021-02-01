import 'package:flutter/material.dart';

class CustomScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      //CustomScrollView是可以使用sliver来自定义滚动模型（效果）的widget
      child: CustomScrollView(
        //Sliver通常指具有特定滚动效果的可滚动块。Sliver本身不包含滚动交互模型
        slivers: <Widget>[
          //AppBar，包含一个导航栏,SliverAppBar可以结合FlexibleSpaceBar实现Material Design中头部伸缩的模型
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('CustomScrollView'),
              background: Image.asset(
                "assets/images/1.png", fit: BoxFit.cover,),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //控制GridView子widget如何排列(layout)
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //纵轴子元素的数量.Grid按两列显示
                mainAxisSpacing: 10.0,//主轴方向的间距
                crossAxisSpacing: 10.0,//纵轴方向子元素的间距
                childAspectRatio: 4.0,//子元素在纵轴长度和主轴长度的比例
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),

          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
                childCount: 50 //50个列表项
            ),
          ),

        ],
      ),
    );
  }
}