// 定义一个函数
printInteger(int aNumber) {
  print('The number is $aNumber.'); // 打印到控制台。

  var name = 'Bob';
//name 变量的类型被推断为 String 。 但是也可以通过指定类型的方式，来改变变量类型。
// 如果对象不限定为单个类型，可以指定为 对象类型 或 动态类型

  dynamic name1 = 'Bob';

// 另一种方式是显式声明可以推断出的类型
  String name2 = 'Bob';

//未初始化的变量默认值是 null。即使变量是数字 类型默认值也是 null，因为在 Dart 中一切
// 都是对象，数字类型 也不例外
  int lineCount;
  print(lineCount == null);

//使用过程中从来不会被修改的变量， 可以使用 final 或 const,Final变量的值只能被设置一
// 次； Const 变量在编译时就已经固定 (Const 变量 是隐式 Final 的类型.) 最高级 final
// 变量或类变量在第一次使用时被初始化。
  final name3 = 'Bob';
  // name3 = 'Alice'; // Error: 一个 final 变量只能被设置一次。

  // 如果需要在编译时就固定变量的值，可以使用 const 类型变量。如果 Const 变量是类级别
  // 的，需要标记为 static const。 在这些地方可以使用在编译时就已经固定不变的值，字面
  // 量的数字和字符串， 固定的变量，或者是用于计算的固定数字
  const bar = 1000000; // 压力单位 (dynes/cm2)
  const double atm = 1.01325 * bar; // 标准气压

  //Const 关键字不仅可以用于声明常量变量。 还可以用来创建常量值，以及声明创建常量值的
  // 构造函数。 任何变量都可以拥有常量值
  var foo = const [];
  final bar2 = const [];
  //声明 const 的初始化表达式中 const 可以被省略
  const baz = [];

  //非 Final ， 非 const 的变量是可以被修改的，即使这些变量 曾经引用过 const 值
  foo = [1, 2, 3];// 曾经引用过 const [] 常量值。

//Const 变量的值不可以修改
//   baz = [42];//// Error: 常量变量不能赋值修改


}

// 应用从这里开始执行。
main() {
  var number = 42; // 声明并初始化一个变量。
  printInteger(number); // 调用函数。
}


/*
*
* 任何保存在变量中的都是一个 对象 ， 并且所有的对象都是对应一个 类 的实例。 无论是数字，
* 函数和 null 都是对象。所有对象继承自 Object 类
*
* 尽管 Dart 是强类型的，但是 Dart 可以推断类型，所以类型注释是可选的。 在上面的代码中，
*  number 被推断为 int 类型。 如果要明确说明不需要任何类型， 需要使用特殊类型 dynamic
*
* Dart 支持泛型，如 List <int> （整数列表）或 List <dynamic> （任何类型的对象列表）
*
* Dart 支持顶级函数（例如 main（））， 同样函数绑定在类或对象上（分别是 静态函数 和
* 实例函数 ）。 以及支持函数内创建函数 （ 嵌套 或 局部函数 ）
*
* Dart 支持顶级 变量 ， 同样变量绑定在类或对象上（静态变量和实例变量）。 实例变量有时
* 称为字段或属性。
*
* 与 Java 不同，Dart 没有关键字 “public” ， “protected” 和 “private” 。 如果标识符
* 以下划线（_）开头，则它相对于库是私有的
*
* 标识符 以字母或下划线（_）开头，后跟任意字母和数字组合
*
* Dart 语法中包含 表达式（ expressions ）（有运行时值）和 语句（ statements ）（没有
* 运行时值）。例如，条件表达式 condition ? expr1 : expr2 的值可能是 expr1 或 expr2。
* 将其与 if-else 语句 相比较，if-else 语句没有值。 一条语句通常包含一个或多个表达式，
* 相反表达式不能直接包含语句。
*
*
* */