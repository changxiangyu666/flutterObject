import 'package:flutter/material.dart';

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset("assets/images/4.png",
          width: animation.value,
          height: animation.value
      ),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>  with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    //AnimationController用于控制动画，它包含动画的启动forward()、停止stop() 、
    // 反向播放 reverse()等方法
    // AnimationController会在动画的每一帧，就会生成一个新的值。默认情况下，
    // AnimationController在给定的时间段内线性的生成从0.0到1.0（默认区间）的数字
    controller = new AnimationController(
        duration: const Duration(seconds: 1),
        // AnimationController生成数字的区间可以通过lowerBound和upperBound来指定
        vsync: this
    );
    //使用弹性曲线
    animation=CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    //Tween来配置动画以生成不同的范围或数据类型的值
    animation = new Tween(begin: 0.0, end: 500.0).animate(controller)
     /* ..addListener(() {
        setState(()=>{});
      })*/;
    //dismissed 	动画在起始点停止
    //forward 	动画正在正向执行
    // reverse 	动画正在反向执行
    // completed 	动画在终点停止
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      child: Image.asset("assets/images/4.png"),
      animation: animation,
    );

    //AnimatedBuilder正是将渲染逻辑分离出来
    // return AnimatedBuilder(
    //   animation: animation,
    //   child: Image.asset("assets/images/4.png"),
    //   builder: (BuildContext ctx, Widget child) {
    //     return new Center(
    //       child: Container(
    //         height: animation.value,
    //         width: animation.value,
    //         child: child,
    //       ),
    //     );
    //   },
    // );

    // return AnimatedImage(animation: animation,);

    // return new Center(
    //   child: Image.asset("assets/images/4.png",
    //       width: animation.value,
    //       height: animation.value
    //   ),
    // );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value,
                width: animation.value,
                child: child
            );
          },
          child: child
      ),
    );
  }
}