import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  static BuildContext context1;
  File _image;
  ImagePicker picker = ImagePicker();

  // This funcion will helps you to pick and Image from Gallery
  _pickImageFromGallery() async {
    PickedFile pickedFile =
    await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    File image = File(pickedFile.path);
    setState(() {
      _image = image;
    });
  }

  // This funcion will helps you to pick and Image from Camera
  _pickImageFromCamera() async {
    PickedFile pickedFile =
    await picker.getImage(source: ImageSource.camera, imageQuality: 50);

    File image = File(pickedFile.path);
    setState(() {
      _image = image;
    });
  }

  void containerForSheet<T>({BuildContext context, Widget child}) {
    showCupertinoModalPopup<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('You clicked $value'),
        duration: Duration(milliseconds: 800),
      ));
    });
  }

  _imgView() {
    containerForSheet<String>(
      context: context,
      child: CupertinoActionSheet(
        // title: const Text('标题'),
        // message: const Text('这里是消息'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text('从文件选图片'),
              onPressed: () {
                _pickImageFromGallery();
                Navigator.pop(
                  context,
                );
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('拍照选择图片'),
              onPressed: () {
                _pickImageFromCamera();
                Navigator.pop(
                  context,
                );
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: new Text(
              '取消',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'PingFangRegular',
                color: const Color(0xFF666666),
              ),
            ),
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }


  Widget loginButton = new Container(
      margin: const EdgeInsets.all(35),
      //这个widget距离父控件左右35（还有个all就是距离左上右下四个方向）
      child: new SizedBox(
          height: 40,
          child: new RaisedButton(
            //一个凸起的材质矩形按钮
              color: Color(0xff3CB964),
              child: new Text(
                '退出',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: () {
                showDialog(
                  context: context1,
                  barrierDismissible: true, //点击弹窗外部是否消失
                  child: CupertinoAlertDialog(
                    title: Text('提示',
                      style: new TextStyle(color: Color(0xFF666666), fontSize: 16),
                    ),
                    content: Text('\n您确定要退出应用程序吗',
                      style: new TextStyle(color: Color(0xFF999999), fontSize: 14),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('确认',style: TextStyle(color: Color(0xFF999999)),),
                        onPressed: () {
                          Navigator.of(context1).pushNamed('/');
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text('取消',style: TextStyle(color: Color(0xFF576B95)),),
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.of(context1).pop();
                        },
                      ),
                    ],
                  ),
                );
              }
          )
      )
  );

  _list(text,url){
    return Container(
      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child:Text(text, style: TextStyle(fontSize: 18),),
              )
          ),
          FlatButton(
            //一个扁平的Material按钮
            child: Container(
                padding: EdgeInsets.only(left: 40),
                child:Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14,)
            ),
            onPressed: () {
              Navigator.of(context1).pushNamed(url);
            },
          ),
        ],
      ),
    );
  }

  _buildCircleImg() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(6.0),
          image: DecorationImage(
              image:_image != null
                  ?FileImage(_image)
                  : AssetImage('assets/images/1.png'),
            fit: BoxFit.fill,
          )
      ),
      child: FlatButton(
        child: Image(
            image: AssetImage(""),
            fit: BoxFit.fill),
        onPressed: _imgView,
      ),
    );
  }

  _buildCenter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('老孟Flutter', style: TextStyle(fontSize: 18),),
        Text('Flutter、Android', style: TextStyle(color: Colors.grey),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    context1 = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        elevation: 0.0,
      ),
      body: ListView(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10,left: 10,right: 10),
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.white,
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 15,
              ),
              _buildCircleImg(),
              SizedBox(
                width: 25,
              ),
              Expanded(
                child: _buildCenter(),
              ),
              FlatButton(
                //一个扁平的Material按钮
                  child: Container(
                    padding: EdgeInsets.only(left: 40),
                      child:Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14,)
                  ),
                  onPressed: () {

                  },
              ),
            ],
          ),
        ),
        _list('意见反馈','#'),
        _list('修改密码','#'),
        _list('客服电话','#'),
        loginButton,
      ]),
    );
  }
}
