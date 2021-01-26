// 定义一个函数
printInteger(int aNumber) {
  print('The number is $aNumber.'); // 打印到控制台。
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