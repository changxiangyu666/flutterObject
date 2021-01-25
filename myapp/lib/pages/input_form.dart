import 'package:flutter/material.dart';

import 'focus_test.dart';

class InputAndForm extends StatefulWidget {
  @override
  _InputAndFormState createState() => new _InputAndFormState();
}

class _InputAndFormState extends State<InputAndForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _unameController = new TextEditingController();
    //监听输入改变
    _unameController.addListener(() {
      print(_unameController.text);
    });
    //设置默认值，并从第三个字符开始选中后面的字符
    _unameController.text = "hello world!";
    _unameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _unameController.text.length);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '输入框及表单',
          style: Theme.of(context).primaryTextTheme.title,
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FocusTestRoute();
              }));
            },
          )
        ],
      ),
      body:
      //父容器
      Container(
        child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "Email",
                hintText: "电子邮件地址",
                prefixIcon: Icon(Icons.email),
                border: InputBorder.none //隐藏下划线
            )
        ),
        decoration: BoxDecoration(
          // 下滑线浅灰色，宽度1像素
            border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
        ),
      )
      /*Theme(
        data: Theme.of(context).copyWith(
          //定义下划线颜色
          hintColor: Colors.grey[200],
          inputDecorationTheme: InputDecorationTheme(
            //定义label字体样式
            labelStyle: TextStyle(color: Colors.grey),
            //定义提示文本样式
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)
          )
        ),
        child: Column(
          children: <Widget>[
            TextField(
              //自动获取焦点
              autofocus: true,
              //设置controller
              controller: _unameController,
              //onChange回调监听文本变化
              onChanged: (v) {
                print("onChange: $v");
              },
              //用于控制TextField的外观显示
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)
              ),
              //是否隐藏正在编辑的文本
              obscureText: true,
            ),
          ],
        ),
      ),*/
    );
  }
}

/*
*
* const TextField({
  ...
  * controller：编辑框的控制器，通过它可以设置/获取编辑框的内容、选择编辑内容、监听编辑文本改变事件
  TextEditingController controller,
  * focusNode：用于控制TextField是否占有当前键盘的输入焦点
  FocusNode focusNode,
  * InputDecoration：用于控制TextField的外观显示，如提示文本、背景颜色、边框等
  InputDecoration decoration = const InputDecoration(),
  * keyboardType：用于设置该输入框默认的键盘输入类型
  * | | text | 文本输入键盘
  * | | multiline | 多行文本，需和maxLines配合使用(设为null或大于1)
  * | | number | 数字；会弹出数字键盘
  * | | phone | 优化后的电话号码输入键盘；会弹出数字键盘并显示”* #”
  * | | datetime | 优化后的日期输入键盘；Android上会显示“: -”
  * | | emailAddress | 优化后的电子邮件地址；会显示“@ .”
  * | | url | 优化后的url输入键盘； 会显示“/ .”
  TextInputType keyboardType,
  * textInputAction：键盘动作按钮图标(即回车键位图标)，它是一个枚举值，有多个可选值
  TextInputAction textInputAction,
  * style：正在编辑的文本样式
  TextStyle style,
  * textAlign: 输入框内编辑文本在水平方向的对齐方式
  TextAlign textAlign = TextAlign.start,
  * autofocus: 是否自动获取焦点
  bool autofocus = false,
  * obscureText：是否隐藏正在编辑的文本
  bool obscureText = false,
  * maxLines：输入框的最大行数，默认为1；如果为null，则无行数限制
  int maxLines = 1,
  * maxLength代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数
  int maxLength,
  * maxLengthEnforced决定当输入文本长度超过maxLength时是否阻止输入，为true时会阻止输入，为false时不会阻止输入但输入框会变红
  bool maxLengthEnforced = true,
  * onChange：输入框内容改变时的回调函数
  ValueChanged<String> onChanged,
  * 在输入框输入完成时触发，onSubmitted回调接收当前输入内容做为参数，而onEditingComplete不接收参数。
  VoidCallback onEditingComplete,
  ValueChanged<String> onSubmitted,
  * inputFormatters：用于指定输入格式；当用户输入内容改变时，会根据指定的格式来校验
  List<TextInputFormatter> inputFormatters,
  * enable：如果为false，则输入框会被禁用
  bool enabled,
  * 用于自定义输入框光标宽度、圆角和颜色
  this.cursorWidth = 2.0,
  this.cursorRadius,
  this.cursorColor,
  ...
})
*
* */
