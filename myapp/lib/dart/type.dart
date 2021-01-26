//Dart 语言支持以下内建类型
/*Number
String
Boolean
List (也被称为 Array)
Map
Set
Rune (用于在字符串中表示 Unicode 字符)
Symbol*/

demo() {
  //必要的时候 int 字面量会自动转换成 double 类型
  double z = 1; // 相当于 double z = 1.0.

  // String -> int
  var one = int.parse('1');
  print(one == 1);

  // String -> double
  var onePointOne = double.parse('1.1');
  print(onePointOne == 1.1);

  // int -> String
  String oneAsString = 1.toString();
  print(oneAsString == '1');

  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  print(piAsString == '3.14');

  //int 特有的传统按位运算操作，移位（<<， >>），按位与（&）以及 按位或（|）
  print((3 << 1) == 6);// 0011 << 1 == 0110
  print((3 >> 1) == 1);// 0011 >> 1 == 0001
  print((3 | 4) == 7); // 0011 | 0100 == 0111

  //字符串可以通过 ${expression} 的方式内嵌表达式。 如果表达式是一个标识符，则 {} 可
  // 以省略。 在 Dart 中通过调用就对象的 toString() 方法来得到对象相应的字符串
  var s = 'string interpolation';

  print('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, ' +
          'which is very handy.');
  print('That deserves all caps. ' +
      '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. ' +
          'STRING INTERPOLATION is very handy!');

  //使用连续三个单引号或者三个双引号实现多行字符串对象的创建
  var s1 = '''
You can create
multi-line strings like this one.
''';

  var s2 = """This is also a
multi-line string.""";

  //使用 r 前缀，可以创建 “原始 raw” 字符串
  var s3 = r"In a raw string, even \n isn't special.";
  print(s3);

  // 检查空字符串。
  var fullName = '';
  print(fullName.isEmpty);

// 检查 0 值。
  var hitPoints = 0;
  print(hitPoints <= 0);

// 检查 null 值。
  var unicorn;
  print(unicorn == null);

// 检查 NaN 。
  var iMeantToDoThis = 0 / 0;
  print(iMeantToDoThis.isNaN);

  //通过字面量创建 Set
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  //创建一个空集，使用前面带有类型参数的 {} ，或者将 {} 赋值给 Set 类型的变量
  var names = <String>{};
// Set<String> names = {}; // 这样也是可以的。
// var names = {}; // 这样会创建一个 Map ，而不是 Set 。

//使用 add() 或 addAll() 为已有的 Set 添加元素
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  // 使用 .length 来获取 Set 中元素的个数
  print(elements.length);

  //Map 是用来关联 keys 和 values 的对象
  //Map 字面量创建
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  //Map 构造函数创建
  var gifts1 = Map();
  gifts1['first'] = 'partridge';
  gifts1['second'] = 'turtledoves';
  gifts1['fifth'] = 'golden rings';

  var nobleGases1 = Map();
  nobleGases1[2] = 'helium';
  nobleGases1[10] = 'neon';
  nobleGases1[18] = 'argon';

  //如果 Map 中不包含所要查找的 key，那么 Map 返回 null
  print(gifts1['1']);
  //使用 .length 函数获取当前 Map 中的 key-value 对数量
  print(gifts1.length);

  //在 Dart 中， Rune 用来表示字符串中的 UTF-32 编码字符
  //表示 Unicode 编码的常用方法是， \uXXXX, 这里 XXXX 是一个4位的16进制数。 例如，心
  // 形符号 (♥) 是 \u2665。 对于特殊的非 4 个数值的情况， 把编码值放到大括号中即可。
  // 例如，emoji 的笑脸 (�) 是 \u{1f600}
  //String 类有一些属性可以获得 rune 数据。 属性 codeUnitAt 和 codeUnit 返回16位编
  // 码数据。 属性 runes 获取字符串中的 Rune

  // 一个 Symbol 对象表示 Dart 程序中声明的运算符或者标识符。 你也许永远都不需要使用
  // Symbol ，但要按名称引用标识符的 API 时， Symbol 就非常有用了。 因为代码压缩后会
  // 改变标识符的名称，但不会改变标识符的符号。 通过字面量 Symbol ，也就是标识符前面
  // 添加一个 # 号，来获取标识符的 Symbol?
  #radix;
  #bar;
}

main() {
  // demo(); // 调用函数。
  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));
}