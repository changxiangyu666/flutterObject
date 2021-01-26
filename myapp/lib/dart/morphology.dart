//Dart 是一门词法作用域的编程语言，就意味着变量的作用域是固定的， 简单说变量的作用域在
// 编写代码的时候就已经确定了。 花括号内的是变量可见的作用域

/*bool topLevel = true;

void main() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      print(topLevel);
      print(insideMain);
      print(insideFunction);
      print(insideNestedFunction);
    }
  }
}*/

//闭包 即一个函数对象，即使函数对象的调用在它原始作用域之外， 依然能够访问在它词法作用
// 域内的变量

//函数可以封闭定义到它作用域内的变量。
// makeAdder() 捕获了变量 addBy。无论在什么时候执行返回函数，函数都会使用捕获的 addBy 变量
// 返回一个函数，返回的函数参数与 [addBy] 相加。

/*Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

void main() {
  // 创建一个加 2 的函数。
  var add2 = makeAdder(2);

  // 创建一个加 4 的函数。
  var add4 = makeAdder(4);

  print(add2(3));
  print(add4(3));
}*/

//顶级函数，静态方法和示例方法相等性的测试示例
void foo() {} // 顶级函数

class A {
  static void bar() {} // 静态方法
  void baz() {} // 示例方法
}

void main() {
  var x;

  // 比较顶级函数。
  x = foo;
  print(foo == x);

  // 比较静态方法。
  x = A.bar;
  print(A.bar == x);

  // 比较实例方法。
  var v = A(); // A的1号实例
  var w = A(); // A的2号实例
  var y = w;
  x = w.baz;

  // 两个闭包引用的同一实例（2号）,
  // 所以它们相等。
  print(y.baz == x);

  // 两个闭包引用的非同一个实例，
  // 所以它们不相等。
  print(v.baz != w.baz);

}