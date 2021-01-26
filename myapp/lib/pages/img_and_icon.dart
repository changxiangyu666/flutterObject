import 'package:flutter/material.dart';

import '../utils/icon_fonts.dart';

class Img extends StatefulWidget {
  @override
  _ImgState createState() => _ImgState();
}

class _ImgState extends State<Img> {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("assets/images/1.png");
    String icons = "";
    icons += "\uE914"; // accessible: &#xE914; or 0xE914 or E914
    icons += " \uE000"; // error: &#xE000; or 0xE000 or E000
    icons += " \uE90D"; // fingerprint: &#xE90D; or 0xE90D or E90D`
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            '图片和Icon',
            style: Theme.of(context).primaryTextTheme.title,
          ),
        ),
        body: ListView(children: <Widget>[
          //从网络加载图片
          Image.network(
            "https://images1.1tu.com/uploads/2021-01/p_1611114142_0f07cbc7809a84bca87379a2bbeeb657.jpg",
            width: 1000,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              //测试Row对齐方式，排除Column默认居中对齐的干扰
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //从asset中加载图片
                Row(
                  //表示子组件在Row所占用的水平空间内对齐方式
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                        image: AssetImage("assets/images/2.png"),
                        width: 100.0,
                        height: 100),
                    Text(" 从asset中加载图片 "),
                  ],
                ),
                Row(
                  //crossAxisAlignment的参考系是verticalDirection，即verticalDirection值为VerticalDirection.down时
                  // crossAxisAlignment.start指顶部对齐，verticalDirection值为VerticalDirection.up时，
                  // crossAxisAlignment.start指底部对齐；而crossAxisAlignment.end和crossAxisAlignment.start正好相反；
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Image.asset("assets/images/1.png", width: 100.0),
                    Text(" 从asset中 ", style: TextStyle(fontSize: 30.0)),
                    Text(" 加载图片 "),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    //MainAxisAlignment.end表示沿textDirection的结尾方向对齐，
                    // 如textDirection取值为TextDirection.ltr时，则MainAxisAlignment.end表示右对齐，
                    // textDirection取值为TextDirection.rtl时表示从左对齐。MainAxisAlignment.end和MainAxisAlignment.start正好相反；
                    mainAxisAlignment: MainAxisAlignment.end,
                    //表示水平方向子组件的布局顺序(是从左往右还是从右往左)，
                    // 默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左)
                    //textDirection是mainAxisAlignment的参考系
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Image(
                          image: img,
                          width: 160.0,
                          height: 100,
                          fit: BoxFit.fill),
                      Column(
                        //表示子组件在纵轴方向的对齐方式 ，Row的高度等于子组件中最高的子元素高度
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(" BoxFit.fill:",
                              style: TextStyle(color: Colors.green)),
                          Text(" 会拉伸填充满显示空间，"),
                          Text(" 图片本身长宽比会发生变化，"),
                          Text(" 图片会变形 "),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    //表示Row在主轴(水平)方向占用的空间，默认是MainAxisSize.max
                    mainAxisSize: MainAxisSize.min,
                    //如果mainAxisSize值为MainAxisSize.min，则此属性无意义，因为子组件的宽度等于Row的宽度
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: img,
                          width: 160.0,
                          height: 100,
                          fit: BoxFit.cover),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(" BoxFit.cover:",
                              style: TextStyle(color: Colors.green)),
                          Text(" 会按图片的长宽比放大后居中"),
                          Text(" 填满显示空间，图片不会变形，"),
                          Text(" 超出显示空间部分会被剪裁 "),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: img,
                          width: 160.0,
                          height: 100,
                          fit: BoxFit.contain),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(" BoxFit.contain:",
                              style: TextStyle(color: Colors.green)),
                          Text(" 这是图片的默认适应规则，"),
                          Text(" 图片会在保证图片本身长宽比"),
                          Text(" 不变的情况下缩放以适应当前 "),
                          Text(" 显示空间，图片不会变形 "),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: img,
                          width: 160.0,
                          height: 100,
                          fit: BoxFit.fitWidth),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(" BoxFit.fitWidth:",
                              style: TextStyle(color: Colors.green)),
                          Text(" 图片的宽度会缩放到显示空间"),
                          Text(" 的宽度，高度会按比例缩放，"),
                          Text(" 然后居中显示，图片不会变形， "),
                          Text(" 超出显示空间部分会被剪裁。 "),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: img,
                          width: 160.0,
                          height: 100,
                          fit: BoxFit.fitHeight),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(" BoxFit.fitHeight:",
                              style: TextStyle(color: Colors.green)),
                          Text(" 图片的高度会缩放到显示空间"),
                          Text(" 的高度，宽度会按比例缩放，"),
                          Text(" 然后居中显示，图片不会变形， "),
                          Text(" 超出显示空间部分会被剪裁。 "),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: img,
                          width: 160.0,
                          height: 100,
                          fit: BoxFit.none),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(" BoxFit.none:",
                              style: TextStyle(color: Colors.green)),
                          Text(" 图片没有适应策略，"),
                          Text(" 会在显示空间内显示图片，"),
                          Text(" 如果图片比显示空间大，则显示 "),
                          Text(" 空间只会显示图片中间部分 "),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/2.png",
                        width: 100.0,
                        height: 100,
                        color: Colors.blue,
                        colorBlendMode: BlendMode.difference,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(" color and colorBlendMode:",
                              style: TextStyle(color: Colors.green)),
                          Text(" 在图片绘制时可以对每一个像素"),
                          Text(" 进行颜色混合处理，"),
                          Text(" color指定混合色， "),
                          Text(" colorBlendMode指定混合模式 "),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  //流式布局
                  child: Wrap(
                    children: <Widget>[
                      //弹性布局
                      Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              "assets/images/2.png",
                              width: 100.0,
                              height: 200,
                              repeat: ImageRepeat.repeatY,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(" repeat:",
                                    style: TextStyle(color: Colors.green)),
                                Text("""当图片本身大小小于显示空间时，指定图片的重复规则
                                """),
                              ],
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      icons,
                      style: TextStyle(
                          fontFamily: "MaterialIcons",
                          fontSize: 24.0,
                          color: Colors.green),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.accessible,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.error,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.fingerprint,
                      color: Colors.green,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      MyIcons.users,
                      color: Colors.purple,
                    ),
                    Icon(
                      MyIcons.chevrons_right,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}

/*
this.width, //图片的宽
this.height, //图片高度
this.color, //图片的混合色值
this.colorBlendMode, //混合模式
this.fit,//缩放模式
this.alignment = Alignment.center, //对齐方式
this.repeat = ImageRepeat.noRepeat, //重复方式*/

/*
*超出屏幕显示范围会自动折行的布局称为流式布局
*  Wrap({
  ...
  this.direction = Axis.horizontal,//排列方向，默认水平方向排列
  this.alignment = WrapAlignment.start,//纵轴方向的对齐方式
  this.spacing = 0.0,// 主轴(水平)方向间距
  this.runAlignment = WrapAlignment.start,////子控件在纵轴上的对齐方式
  this.runSpacing = 0.0,// 纵轴（垂直）方向间距
  this.crossAxisAlignment = WrapCrossAlignment.start,//纵轴上子控件的对齐方式
  this.textDirection,//textDirection水平方向上子控件的起始位置
  this.verticalDirection = VerticalDirection.down,//垂直方向上子控件的其实位置
  List<Widget> children = const <Widget>[],//要显示的子控件集合
})
* */
