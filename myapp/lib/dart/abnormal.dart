import 'dart:math';

void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // Runtime error
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    rethrow; // Allow callers to see the exception.
  }finally {
    print('main() finished handling.'); // Then clean up.
  }
}

/*class Point {
  num x; // 声明示例变量 x，初始值为 null 。
  num y; // 声明示例变量 y，初始值为 null 。
  num z = 0; // 声明示例变量 z，初始值为 0 。
}*/

class Person {
  String firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

class Point {
  final num x;
  final num y;
  final num distanceFromOrigin;

  Point(x, y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y);
}

//重定向构造函数
class Point1 {
  num x, y;

  // 类的主构造函数。
  Point1(this.x, this.y);

  // 指向主构造函数
  Point1.alongXAxis(num x) : this(x, 0);
}

//常量构造函数
class ImmutablePoint {
  static final ImmutablePoint origin =
  const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);
}

//工厂构造函数
class Logger {
  final String name;
  bool mute = false;

  // 从命名的 _ 可以知，
  // _cache 是私有属性。
  static final Map<String, Logger> _cache =
  <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

// Getter 和 Setter 是用于对象属性读和写的特殊方法,使用 get 和 set 关键字实现 Getter和 Setter
class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  //实例方法 定义两个计算属性： right 和 bottom。
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

//使用 abstract 修饰符来定义 抽象类 — 抽象类不能实例化
abstract class Doer {
  // 定义实例变量和方法 ...

  void doSomething(); // 定义一个抽象方法。
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // 提供方法实现，所以这里的方法就不是抽象方法了...
  }
}

// person 类。 隐式接口里面包含了 greet() 方法声明。
class Person1 {
  // 包含在接口里，但只在当前库中可见。
  final _name;

  // 不包含在接口里，因为这是一个构造函数。
  Person1(this._name);

  // 包含在接口里。
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// person 接口的实现。
class Impostor implements Person1 {
  get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person1 person) => person.greet('Bob');

//使用 extends 关键字来创建子类， 使用 super 关键字来引用父类
class Television {
  void turnOn() {
    // _illuminateDisplay();
    // _activateIrSensor();
  }
// ···
}

class SmartTelevision extends Television {
  //可以使用 @override 注解指出想要重写的成员
  @override
  void turnOn() {
    super.turnOn();
    // _bootNetworkInterface();
    // _initializeMemory();
    // _upgradeApps();
  }
// ···
}

class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);
}

void main() {
  // var point = Point();
  // point.x = 4;
  // print(point.x);

  // var emp = new Employee.fromJson({});
  // if (emp is Person) {
  //   // Type check
  //   emp.firstName = 'Bob';
  // }
  // (emp as Person).firstName = 'Bob';

  // var p = new Point(2, 3);
  // print(p.distanceFromOrigin);

  // var logger = Logger('UI');
  // logger.log('Button clicked');

  // var rect = Rectangle(3, 4, 20, 15);
  // assert(rect.left == 3);
  // rect.right = 12;
  // assert(rect.left == -8);

  // print(greetBob(Person1('Kathy')));
  // print(greetBob(Impostor()));

  final v = Vector(2, 3);
  final w = Vector(2, 2);
  print(v + w );
  print(v - w );
  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }
}