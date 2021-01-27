import 'package:flutter/material.dart';

class CascadeRoute extends StatefulWidget{
  @override
  _CascadeRouteState  createState() => new _CascadeRouteState();
}

class _CascadeRouteState extends State<CascadeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          '层叠布局',
          style: Theme.of(context).primaryTextTheme.title,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        //通过ConstrainedBox来确保Stack占满屏幕
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
            // fit: StackFit.expand, //未定位widget占满Stack整个空间
            children: <Widget>[
              Positioned(
                top: 300,
                left: 50.0,
                child: Container(
                  child: Text("I am Jack",style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.only(left:5.0,top: 40),
                ),
              ),
              Container(
                child: Text("Hello world",style: TextStyle(color: Colors.white)),
                color: Colors.red,
                width: 100,
                height: 100,
                padding: EdgeInsets.only(left:5.0,top: 40),
              ),
              Positioned(
                top: 260.0,
                left: 110,
                child: Container(
                  child: Text("Your friend",style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(5.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


/*
* Stack允许子widget堆叠
* Stack({
* alignment：此参数决定如何去对齐没有定位（没有使用Positioned）或部分定位的子widget。
* 所谓部分定位，在这里特指没有在某一个轴上定位：left、right为横轴，top、bottom为纵轴，
* 只要包含某个轴上的一个定位属性就算在该轴上有定位。
  this.alignment = AlignmentDirectional.topStart,
* textDirection的值为TextDirection.ltr，则alignment的start代表左，end代表右；
* textDirection的值为TextDirection.rtl，则alignment的start代表右，end代表左。
  this.textDirection,
* 此参数用于决定没有定位的子widget如何去适应Stack的大小。StackFit.loose表示使用子
* widget的大小，StackFit.expand表示扩伸到Stack的大小
  this.fit = StackFit.loose,
* 此属性决定如何显示超出Stack显示空间的子widget，值为Overflow.clip时，超出部分会被剪
* 裁（隐藏），值为Overflow.visible 时则不会
  this.overflow = Overflow.clip,
  List<Widget> children = const <Widget>[],
})
*
* */

/*
* const Positioned({
  Key key,
  this.left,//离Stack左边的距离
  this.top,//离Stack上边的距离
  this.right,//离Stack右边的距离
  this.bottom,//离Stack底边的距离
  this.width,//指定定位元素的宽度
  this.height,//指定定位元素的高度
  @required Widget child,
  * 在水平方向时，你只能指定left、right、width三个属性中的两个，如指定left和width后，
  * right会自动算出(left+width)，如果同时指定三个属性则会报错，垂直方向同理
})
*
*
* */