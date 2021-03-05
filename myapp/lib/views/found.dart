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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //表尾标记
  static const loadingTag = "##loading##";
  List _imageFile = [loadingTag];
  List _videoFile = [loadingTag];
  File _image;
  File _cameraImage;
  File _video;
  File _cameraVideo;

  ImagePicker picker = ImagePicker();

  VideoPlayerController _videoPlayerController;
  VideoPlayerController _cameraVideoPlayerController;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
  }

  // This funcion will helps you to pick and Image from Gallery
  _pickImageFromGallery() async {
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    File image = File(pickedFile.path);
    _imageFile.insertAll(_imageFile.length - 1, [pickedFile.path]);
    setState(() {
      _image = image;
    });
  }

  // This funcion will helps you to pick and Image from Camera
  _pickImageFromCamera() async {
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 50);

    File image = File(pickedFile.path);
    _imageFile.insertAll(_imageFile.length - 1, [pickedFile.path]);
    setState(() {
      _cameraImage = image;
    });
  }

  // This funcion will helps you to pick a Video File
  _pickVideo() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.gallery);

    _video = File(pickedFile.path);
    _videoFile.insertAll(_videoFile.length - 1, [pickedFile.path]);
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
    _videoFile.insertAll(_videoFile.length - 1, [pickedFile.path]);
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
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))
//              border: Border.all(color: Colors.grey,width: 0.5),
//              borderRadius: BorderRadius.circular(5),
                  ),
              child: Text('图片（六张）', style: TextStyle(color: Colors.green)),
            ),
            Wrap(
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
                        itemCount:
                            _imageFile.length > 6 ? 6 : _imageFile.length,
                        // itemCount: _imageFile.length,
                        itemBuilder: (BuildContext context, index) {
                          if (_imageFile[index] == loadingTag) {
                            if (_imageFile.length - 1 < 6) {
                              return Container(
                                margin: EdgeInsets.all(6),
                                //容器外补白
                                constraints: BoxConstraints.tightFor(
                                    width: 80.0, height: 80.0),
                                //卡片大小
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  //背景装饰
                                  gradient: RadialGradient(
                                      //背景径向渐变
                                      colors: [
                                        Color(0xfff6f6f6),
                                        Color(0xfff6f6f6)
                                      ], center: Alignment.topLeft),
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
                              );
                            } else {
                              setState(() {
                                //重新构建列表
                              });
                            }
                          }
                          return Container(
                            margin: EdgeInsets.all(6),
                            //容器外补白
                            constraints: BoxConstraints.tightFor(
                                width: 80.0, height: 80.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.black26,
                                )),
                            child: Image.file(
                              File(_imageFile[index]),
                              height: 80,
                              width: 80,
                              fit: BoxFit.fill,
                            ),
                          );
                        }),
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
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))
//              border: Border.all(color: Colors.grey,width: 0.5),
//              borderRadius: BorderRadius.circular(5),
                  ),
              child: Text('视频（三个）', style: TextStyle(color: Colors.green)),
            ),
            Wrap(
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
                    itemCount:
                    _videoFile.length > 3 ? 3 : _videoFile.length,
                    itemBuilder: (BuildContext context, index) {
                      if (_videoFile[index] == loadingTag) {
                        if (_videoFile.length - 1 < 3) {
                          return Container(
                            margin: EdgeInsets.all(6),
                            //容器外补白
                            constraints: BoxConstraints.tightFor(
                                width: 80.0, height: 80.0),
                            //卡片大小
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              //背景装饰
                              gradient: RadialGradient(
                                //背景径向渐变
                                  colors: [
                                    Color(0xfff6f6f6),
                                    Color(0xfff6f6f6)
                                  ], center: Alignment.topLeft),
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
                          );
                        } else {
                          setState(() {
                            //重新构建列表
                          });
                        }
                      }
                      return Container(
                        margin: EdgeInsets.all(6),
                        //容器外补白
                        constraints: BoxConstraints.tightFor(
                            width: 80.0, height: 80.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.black26,
                            )),
                        // child: VideoPlayer(_videoPlayerController),
                        child: VideoPlayer(VideoPlayerController.file(File(_videoFile[index]))
                          ..initialize().then((_) {
                            setState(() {});
                            _cameraVideoPlayerController.play();
                          })) ,
                      );
                    }),
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
                Navigator.pop(
                  context,
                );
              },
            ),
            CupertinoActionSheetAction(
              child: const Text("摄像机"),
              onPressed: () {
                _pickVideoFromCamera();
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
}
