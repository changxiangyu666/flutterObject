//在 运算符表 中， 每一行的运算符优先级，由上到下依次排列

/*
*  描述                      运算符
*  一元后缀                  expr++    expr--    ()    []    .    ?.
*  一元前缀                  -expr    !expr    ~expr    ++expr    --expr
*  乘法的                    *    /    %   ~/
*  加减                      +    -
*  移位                      <<    >>    >>>
*  按位与                    &
*  按位异或                  ^
*  按位或                    |
*  关系与类型判定             >=    >    <=    <    as    is    is!
*  相等                      ==    !=
*  逻辑与                    &&
*  逻辑或                    ||
*  如果为空                  ??
*  条件                      expr1 ? expr2 : expr3
*  级联                      ..
*  赋值                      =    *=    /=   +=   -=   &=   ^=   etc.
*
* */

//算术运算符
/*
*  运算符                    意义
*  +                         加（Add）
*  –                         减（Subtract）
*  -expr                     一元减，也称为否定（与表达式的符号相反）
*  *                         乘（Multiply）
*  /                         除（Divide）
*  ~/                        除法，返回整数结果
*  %                         获取整数除法的余数
*
*  */

demo(){
  print(5 / 2); // 结果是双浮点型2.5
  print(5 ~/ 2); // 结果是整型2
  print(5 % 2); // 余数1

  print('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');
}

//前缀和后缀，自增和自减运算符
/*
*  运算符                    意义
*  ++var                     var = var + 1(表达式值为var+1)
*  var++                     var = var + 1(表达式值为var)
*  --var                     var = var – 1(表达式值为var-1)
*  var--                     var = var – 1(表达式值为var)
*
*  */
demo2(){
  var a, b;

  a = 0;
  b = ++a; // a自加后赋值给b。
  print('$a,$b');

  a = 0;
  b = a++; // a先赋值给b后，a自加。
  print('$a,$b');

  a = 0;
  b = --a; // a自减后赋值给b。
  print('$a,$b');

  a = 0;
  b = a--; // a先赋值给b后，a自减。
  print('$a,$b');
}

//关系运算符
/*
*  运算符                    意义
*  ==                        相等
*  !=                        不相等
*  >                         大于
*  <                         小于
*  >=                        大于等于
*  <=                        小于等于
*
*  */
//两个对象x和y是否表示相同的事物， 使用 == 运算符。 (在极少数情况下， 要确定两个对象是
// 否完全相同，需要使用 identical() 函数。)

//类型判定运算符
/*
*  运算符                    意义
*  as                        类型映射(也被用于指定库前缀)
*  is                        如果对象具有指定的类型，则为True
*  is!                       如果对象具有指定的类型，则为False
*
*  */

//赋值运算符
demo3(){
  var a, b;
  // 将值赋值给变量a
  a = 'value';
  // b=2;
  // 如果b为空时，将变量赋值给b，否则，b的值保持不变。
  b ??= 'value';
  print(b);
}

//复合赋值运算符
//= 	–= 	/=    %= 	 >>= 	^=
//+= 	*= 	~/= 	<<= 	&= 	|=
demo4(){
  var a = 2; // 使用 = 赋值
  a *= 3; // 赋值并做乘法运算： a = a * 3
  print(a);
}

//逻辑运算符
//!expr（逻辑非）   ||（逻辑或）    &&（逻辑与）
demo5(){
  var done=true;
  var col=3;
  print(!done && (col == 0 || col == 3));
}

//按位和移位运算符
//&  |  ^(相同0，不同1)   ~expr(一元位补码（0变为1；1变为0）)  <<(后补0)  >>(前补0)
demo6(){
  final value = 0x22;//00100010
  final bitmask = 0x0f;//00001111
  print((value & bitmask) == 0x02);
  print((value & ~bitmask) == 0x20);
  print((value | bitmask) == 0x2f);
  print((value ^ bitmask) == 0x2d);
  print((value << 4) == 0x220);
  print((value >> 4) == 0x02);
}

//条件表达式
//condition ? expr1 : expr2
//如果条件为 true, 执行 expr1 (并返回它的值)： 否则, 执行并返回 expr2 的值
// expr1 ?? expr2
// 如果 expr1 是 not-null， 返回 expr1 的值； 否则, 执行并返回 expr2 的值。
demo7(){
  // var expr1=null;
  var expr1=6;
  var expr2=3;
  print(expr1??expr2);
}

//级联运算符 (..)  可以实现对同一个对像进行一系列的操作
/*
* querySelector('#confirm') // 获取对象。
  ..text = 'Confirm' // 调用成员变量。
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'));
  *等价于
  *var button = querySelector('#confirm');
button.text = 'Confirm';
button.classes.add('important');
button.onClick.listen((e) => window.alert('Confirmed!'));
  *
* */

main(){
  // demo();
  // demo2();
  // demo3();
  // demo4();
  // demo5();
  // demo6();
  demo7();
  var text;
  dynamic urlString='https://baidui.com';
  //如果 assert 语句中的布尔条件为 false ， 那么正常的程序执行流程会被中断
  // assert 语句只在开发环境中有效， 在生产环境是无效的
  assert(text != null);
  // 确认 URL 是否是 https 类型。
  assert(urlString.startsWith('https'));
  //assert 的第二个参数可以为其添加一个字符串消息
  assert(urlString.startsWith('https'),
  'URL ($urlString) should start with "https".');
  //assert 的第一个参数可以是解析为布尔值的任何表达式。 如果表达式结果为 true ，
  // 则断言成功，并继续执行。 如果表达式结果为 false ， 则断言失败，并抛出异常
}