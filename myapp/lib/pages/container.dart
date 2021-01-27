import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContainerRoute extends StatefulWidget{
  @override
  _ContainerRouteState createState() => new _ContainerRouteState();
}
class _ContainerRouteState extends State<ContainerRoute>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          '容器类',
          style: Theme.of(context).primaryTextTheme.title,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children:<Widget>[
            //布局限制类容器
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: double.infinity, //宽度尽可能大
                  minHeight: 50.0 //最小高度为50像素
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 6),
                height: 5.0,
                child: gradientBox
              ),
            ),
            Row(
              children: [
                //用于给子widget指定固定的宽高
                SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: redBox
                ),
                //实际上SizedBox和只是ConstrainedBox一个定制，上面代码等价于
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
                  child: Container(
                      margin: EdgeInsets.only(left: 6),
                      child: redBox
                  ),
                )
              ],
            ),
            //多重限制
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
              //父限制的minHeight(100.0)仍然是生效的，只不过它不影响最终子元素的大小，
              // 但仍然还是占有相应的空间,可以认为此时的父ConstrainedBox是作用于
              // 子ConstrainedBox上，而redBox只受子ConstrainedBox限制
              child: UnconstrainedBox( //“去除”父级限制
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                  //对于minWidth和minHeight来说，是取父子中相应数值较大的
                  child: Container(
                      margin: EdgeInsets.only(top: 6),
                      child: redBox
                  ),
                )
              )
            ),

            //Transform变换
            Container(
              color: Colors.black,
              margin: EdgeInsets.only(top: 20),
              child: new Transform(
                alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
            Wrap(
              children: [
                //平移
                Container(
                  color: Colors.red,
                  margin: EdgeInsets.only(top: 10,left: 30),
                  // Transform.translate接收一个offset参数，可以在绘制时沿x、y轴对
                  // 子widget平移指定的距离。
                  //默认原点为左上角，左移20像素，向上平移5像素
                  child: Transform.translate(
                    offset: Offset(-20.0, -5.0),
                    child: Text("Hello world"),
                  ),
                ),
                //旋转
                Container(
                  color: Colors.red,
                  margin: EdgeInsets.only(top: 30,left: 30),
                  child: Transform.rotate(
                    //旋转90度
                    angle:math.pi/2 ,
                    child: Text("Hello world"),
                  ),
                ),
                //缩放
                Container(
                  color: Colors.red,
                  margin: EdgeInsets.only(top: 10,left: 30),
                  child: Transform.scale(
                      scale: 1.5, //放大到1.5倍
                      child: Text("Hello world")
                  )
                ),
                Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),),
                Container(
                  color: Colors.red,
                  margin: EdgeInsets.only(top: 10,left: 30),
                  //RotatedBox的变换是在layout阶段，会影响在子widget的位置和大小
                  child: RotatedBox(
                    quarterTurns: 1, //旋转90度(1/4圈)
                    child: Text("Hello world"),
                  ),
                ),
                Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),),
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外补白
              constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
              decoration: BoxDecoration(//背景装饰
                  gradient: RadialGradient( //背景径向渐变
                      colors: [Colors.red, Colors.orange],
                      center: Alignment.topLeft,
                      radius: .98
                  ),
                  boxShadow: [ //卡片阴影
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0
                    )
                  ]
              ),
              transform: Matrix4.rotationZ(.2), //卡片倾斜变换
              alignment: Alignment.center, //卡片内文字居中
              child: Text( //卡片文字
                "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
  //装饰容器
  Widget redBox=DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.red,
    ),
  );
  Widget gradientBox=DecoratedBox(
    decoration: BoxDecoration(
      //背景渐变
      gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]),
      //3像素圆角
      borderRadius: BorderRadius.circular(3.0),
      //阴影
      boxShadow: [
        BoxShadow(
            color:Colors.black54,
            offset: Offset(2.0,2.0),
            blurRadius: 4.0
        )
      ]
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 160.0, vertical: 13.0),
      child: Text("Login in", style: TextStyle(color: Colors.white),),
    )
  );
}

/*
* 布局限制类容器ConstrainedBox和SizedBox
* BoxConstraints用于设置限制条件
* const BoxConstraints({
  this.minWidth = 0.0, //最小宽度
  this.maxWidth = double.infinity, //最大宽度
  this.minHeight = 0.0, //最小高度
  this.maxHeight = double.infinity //最大高度
})
*BoxConstraints.tight(Size size)，它可以生成给定大小的限制；
* const BoxConstraints.expand()可以生成一个尽可能大的用以填充另一个容器的BoxConstraints
* */

/*
* 装饰容器DecoratedBox
*const DecoratedBox({
* decoration：代表将要绘制的装饰，它类型为Decoration，Decoration是一个抽象类，
* 它定义了一个接口 createBoxPainter()，子类的主要职责是需要通过实现它来创建一个画笔，
* 该画笔用于绘制装饰。
  Decoration decoration,
* position：此属性决定在哪里绘制Decoration，它接收DecorationPosition的枚举类型，
* 该枚举类两个值：
    background：在子widget之后绘制，即背景装饰。
    foreground：在子widget之上绘制，即前景。
  DecorationPosition position = DecorationPosition.background,
  Widget child
})
*
*BoxDecoration({
  Color color, //颜色
  DecorationImage image,//图片
  BoxBorder border, //边框
  BorderRadiusGeometry borderRadius, //圆角
  List<BoxShadow> boxShadow, //阴影,可以指定多个
  Gradient gradient, //渐变
  BlendMode backgroundBlendMode, //背景混合模式
  BoxShape shape = BoxShape.rectangle, //形状
})
*
* */

/*
*Container容器是DecoratedBox、ConstrainedBox、Transform、Padding、Align等widget
* 的一个组合widget只需通过一个Container可以实现同时需要装饰、变换、限制的场景
*Container({
  this.alignment,
  this.padding, //容器内补白，属于decoration的装饰范围
  Color color, // 背景色
  Decoration decoration, // 背景装饰
  Decoration foregroundDecoration, //前景装饰
  double width,//容器的宽度
  double height, //容器的高度
  BoxConstraints constraints, //容器大小的限制条件
  this.margin,//容器外补白，不属于decoration的装饰范围
  this.transform, //变换
  this.child,
})
*
*
* 容器的大小可以通过width、height属性来指定，也可以通过constraints来指定，如果同时存在
 时，width、height优先。实际上Container内部会根据width、height来生成一个constraints。
* color和decoration是互斥的，实际上，当指定color时，Container内会自动创建一个decoration。

* */
