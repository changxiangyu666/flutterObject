//Dart 是一门真正面向对象的语言， 甚至其中的函数也是对象，并且有它的类型 Function 。
// 这也意味着函数可以被赋值给变量或者作为参数传递给其他函数。 也可以把 Dart 类的实例
// 当做方法来调用

import 'package:flutter/cupertino.dart';

bool isNoble(int atomicNumber) {
  return atomicNumber != null;
}

//如果函数中只有一句表达式，可以使用简写语法
bool isNoble1(int atomicNumber) => atomicNumber != null;

//函数有两种参数类型: required 和 optional。 required 类型参数在参数最前面， 随后是
// optional 类型参数。 命名的可选参数也可以标记为 “@ required”

//可选参数可以是命名参数或者位置参数，但一个参数只能选择其中一种方式修饰
void enableFlags({bool bold, bool hidden}) {}

//使用 @required 注释表示参数是 required 性质的命名参数， 该方式可以在任何 Dart
// 代码中使用（不仅仅是Flutter）
 Scrollbar({Key key, @required Widget child}){}

 //位置可选参数
// 将参数放到 [] 中来标记参数是可选的
String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

//在定义方法的时候，可以使用 = 来定义可选参数的默认值。 默认值只能是编译时常量。
// 如果没有提供默认值，则默认值为 null。
void enableFlags1({bool bold = false, bool hidden = false}) {}

//为位置参数设置默认值
String say1(String from, String msg,
    [String device = 'carrier pigeon', String mood]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }
  return result;
}

//list 或 map 可以作为默认值传递
void doStuff(
    {List<int> list = const [1, 2, 3],
      Map<String, String> gifts = const {
        'first': 'paper',
        'second': 'cotton',
        'third': 'leather'
      }}) {
  print('list:  $list');
  print('gifts: $gifts');
}

main() {
  print(say('Bob','Howdy'));
  print(say('Bob','Howdy','smoke signal'));
  print(say1('Bob','Howdy'));
  doStuff();
  //.. 语法为 级联调用 （cascade）。 使用级联调用，可以简化在一个对象上执行的多个操作
  /*void Function(MouseEvent event) reverseText;
  querySelector('#sample_text_id')
    ..text = 'Click me!'
    ..onClick.listen(reverseText);*/

  //一个函数可以作为另一个函数的参数
  void printElement(int element) {
    print(element);
  }

  var list = [1, 2, 3];

// 将 printElement 函数作为参数传递。
  list.forEach(printElement);

  //将一个函数赋值给一个变量
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  print(loudify('hello'));

  var list1 = ['apples', 'bananas', 'oranges'];
  list1.forEach((item) { //无类型参数 item 的匿名函数
    print('${list1.indexOf(item)}: $item');
  });
  list1.forEach(
          (item) => print('${list1.indexOf(item)}: $item'));
}