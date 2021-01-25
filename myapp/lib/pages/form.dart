import 'package:flutter/material.dart';

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => new _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  //FormState为Form的State类，可以通过Form.of()或GlobalKey获得
  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'login',
          style: Theme.of(context).primaryTextTheme.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          //设置globalKey，用于后面获取FormState
          key: _formKey,
          //开启自动校验
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "用户名不能为空";
                  }
              ),
              TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)
                  ),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v
                        .trim()
                        .length > 5 ? null : "密码不能少于6位";
                  }
              ),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    //Expanded 用来平分布局占用比例
                    Expanded(
                      /*child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text("登录"),
                        color: Theme
                            .of(context)
                            .primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          //在这里不能通过此方式获取FormState，context不对
                          //此处的context为FormTestRoute的context
                          //print(Form.of(context));

                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据。
                          if((_formKey.currentState as FormState).validate()){
                            //验证通过提交数据
                          }
                        },
                      ),*/
                      // 通过Builder来获取RaisedButton所在widget树的真正context(Element)
                      child:Builder(builder: (context){
                        return RaisedButton(
                          child: Text("登录"),
                          onPressed: () {
                            //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                            if(Form.of(context).validate()){
                              //验证通过提交数据
                            }
                          },
                        );
                      })
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


/*
*
* Form({
  @required Widget child,
  * autovalidate：是否自动校验输入内容；当为true时，
  * 每一个子FormField内容发生变化时都会自动校验合法性，并直接显示错误信息。
  * 否则，需要通过调用FormState.validate()来手动校验
  bool autovalidate = false,
  * onWillPop：决定Form所在的路由是否可以直接返回
  WillPopCallback onWillPop,
  * onChanged：Form的任意一个子FormField内容发生变化时会触发此回调
  VoidCallback onChanged,
})
*
*const FormField({
  ...
  FormFieldSetter<T> onSaved, //保存回调
  FormFieldValidator<T>  validator, //验证回调
  T initialValue, //初始值
  bool autovalidate = false, //是否自动校验。
})
*
* */