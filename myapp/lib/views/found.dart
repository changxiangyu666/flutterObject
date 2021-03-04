import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:myapp/pages/custom.dart';
import 'package:video_player/video_player.dart';

class FoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FoundPage'),
        elevation: 0.0,
      ),
      body: MyHomePage(),
    );
  }
}

class UserOptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserOptionsState();
  }
}

class UserOptionsState extends State<UserOptions> {
  File _image;
  File _cameraImage;
  File _video;
  File _cameraVideo;

  ImagePicker picker = ImagePicker();

  VideoPlayerController _videoPlayerController;
  VideoPlayerController _cameraVideoPlayerController;

  /*图片控件*/
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("请选择图片或拍照"),
      );
    } else {
      return Image.file(
        imgPath,
      );
    }
  }

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
    print(image);
    setState(() {
      _cameraImage = image;
    });
  }

  // This funcion will helps you to pick a Video File
  _pickVideo() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.gallery);

    _video = File(pickedFile.path);

    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  // This funcion will helps you to pick a Video File from Camera
  _pickVideoFromCamera() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.camera);

    _cameraVideo = File(pickedFile.path);

    _cameraVideoPlayerController = VideoPlayerController.file(_cameraVideo)
      ..initialize().then((_) {
        setState(() {});
        _cameraVideoPlayerController.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Builder(
        builder: (BuildContext context) {
          return Center(
              child: Column(
            children: <Widget>[
              RaisedButton(
                  child: Text('Like my Work ?'),
                  onPressed: () {
                    containerForSheet<String>(
                      context: context,
                      child: CupertinoActionSheet(
                          title: const Text('标题'),
                          message: const Text('这里是消息'),
                          actions: <Widget>[
                            CupertinoActionSheetAction(
                              child: const Text('从文件选图片'),
                              onPressed: () {
                                _pickImageFromGallery();
                                // _openGallery();
                                Navigator.pop(context, _image);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text('拍照选择图片'),
                              onPressed: () {
                                _pickImageFromCamera();
                                // _takePhoto();
                                Navigator.pop(context, _cameraImage);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text("从文件选视频"),
                              onPressed: () {
                                _pickVideo();
                                Navigator.pop(context, _video);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text("摄像机"),
                              onPressed: () {
                                _pickVideoFromCamera();
                                Navigator.pop(context, _cameraVideo);
                              },
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            child: new Text(
                              '取消',
                              style: TextStyle(
                                fontSize: 13.0,
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
                  }),
              _ImageView(_image),
            ],
          ));
        },
      ),
    );
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
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<File> _imageFile = [];
  List<File> _videoFile = [];
  File _image;
  File _cameraImage;
  File _video;
  File _cameraVideo;

  ImagePicker picker = ImagePicker();

  VideoPlayerController _videoPlayerController;
  VideoPlayerController _cameraVideoPlayerController;
  Future<void> _initializeVideoPlayerFuture;


  // This funcion will helps you to pick and Image from Gallery
  _pickImageFromGallery() async {
    PickedFile pickedFile =
    await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    File image = File(pickedFile.path);
    _imageFile.add(image);
    setState(() {
      _image = image;
    });
  }

  // This funcion will helps you to pick and Image from Camera
  _pickImageFromCamera() async {
    PickedFile pickedFile =
    await picker.getImage(source: ImageSource.camera, imageQuality: 50);

    File image = File(pickedFile.path);
    _imageFile.add(image);
    setState(() {
      _cameraImage = image;
    });
  }

  // This funcion will helps you to pick a Video File
  _pickVideo() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.gallery);

    _video = File(pickedFile.path);
    _videoFile.add(_video);
    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  // This funcion will helps you to pick a Video File from Camera
  _pickVideoFromCamera() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.camera);

    _cameraVideo = File(pickedFile.path);
    _videoFile.add(_cameraVideo);
    _cameraVideoPlayerController = VideoPlayerController.file(_cameraVideo)
      ..initialize().then((_) {
        setState(() {});
        _cameraVideoPlayerController.play();
      });
  }

  //上传图片用
  ScrollController _imgController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: const EdgeInsets.all(10.0), children: <Widget>[
        Card(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))
//              border: Border.all(color: Colors.grey,width: 0.5),
//              borderRadius: BorderRadius.circular(5),
              ),
              child: Text('图片（六张）', style: TextStyle(color: Colors.green)),
            ),
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _imageFile.length == 0
                    ? Container()
                    : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: _imageFile.length>6?6:_imageFile.length,
                    // itemCount: _imageFile.length,
                    itemBuilder: (BuildContext context, index) {
                      return Wrap(
                        // spacing: 8.0, // 主轴(水平)方向间距
                        runSpacing: 4.0, // 纵轴（垂直）方向间距
                        alignment: WrapAlignment.center, //沿主轴方向居中
                        children: <Widget>[
                          Image.file(
                            _imageFile[index],
                            height: 80,
                            width: 80,
                            fit: BoxFit.fill,
                          ),
                        ],

                      );
                    }),
                _imageFile.length >= 6
                    ? Container()
                    :Container(
                  margin: EdgeInsets.all(6),
                  //容器外补白
                  constraints: BoxConstraints.tightFor(width: 80.0, height: 80.0),
                  //卡片大小
                  decoration: BoxDecoration(
                    //背景装饰
                      gradient: RadialGradient(
                        //背景径向渐变
                          colors: [Color(0xfff6f6f6),Color(0xfff6f6f6)],
                          center: Alignment.topLeft,
                          radius: .6),
                  ),
                  alignment: Alignment.center,
                  //卡片内文字居中
                  child: FlatButton(
                    height: 80,
                    minWidth: 80,
                    splashColor: Colors.grey,
                    child: Icon(
                      Icons.add,
                      color: Color(0xffcacaca),
                      size: 24.0,
                    ),
                    onPressed: _imgView,
                  ),
                ),
              ],
            ),
          ]),
        ),

        Card(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))
//              border: Border.all(color: Colors.grey,width: 0.5),
//              borderRadius: BorderRadius.circular(5),
              ),
              child: Text('视频（六张）', style: TextStyle(color: Colors.green)),
            ),
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                _videoFile.length == 0
                    ? Container()
                    : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: _videoFile.length>6?6:_videoFile.length,
                    // itemCount: _imageFile.length,
                    itemBuilder: (BuildContext context, index) {
                      return Wrap(
                        // spacing: 8.0, // 主轴(水平)方向间距
                        runSpacing: 4.0, // 纵轴（垂直）方向间距
                        alignment: WrapAlignment.center, //沿主轴方向居中
                        children: <Widget>[
                          Image.file(
                            _videoFile[index],
                            height: 80,
                            width: 80,
                            fit: BoxFit.fill,
                          ),
                        ],

                      );
                    }),
                _videoFile.length >= 6
                    ? Container()
                    :Container(
                  margin: EdgeInsets.all(6),
                  //容器外补白
                  constraints: BoxConstraints.tightFor(width: 80.0, height: 80.0),
                  //卡片大小
                  decoration: BoxDecoration(
                    //背景装饰
                    gradient: RadialGradient(
                      //背景径向渐变
                        colors: [Color(0xfff6f6f6),Color(0xfff6f6f6)],
                        center: Alignment.topLeft,
                        radius: .6),
                  ),
                  alignment: Alignment.center,
                  //卡片内文字居中
                  child: FlatButton(
                    height: 80,
                    minWidth: 80,
                    splashColor: Colors.grey,
                    child: Icon(
                      Icons.add,
                      color: Color(0xffcacaca),
                      size: 24.0,
                    ),
                    onPressed: _videoView,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ]),
    );
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
                Navigator.pop(context,);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('拍照选择图片'),
              onPressed: () {
                _pickImageFromCamera();
                Navigator.pop(context,);
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

  _videoView() {
    containerForSheet<String>(
      context: context,
      child: CupertinoActionSheet(
        // title: const Text('标题'),
        // message: const Text('这里是消息'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text("从文件选视频"),
              onPressed: () {
                _pickVideo();
                Navigator.pop(context,);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text("摄像机"),
              onPressed: () {
                _pickVideoFromCamera();
                Navigator.pop(context,);
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

}

