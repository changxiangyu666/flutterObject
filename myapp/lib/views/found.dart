import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class FoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FoundPage'),
        elevation: 0.0,
      ),
      body: UserOptions(),
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

  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

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
                                // _pickImageFromGallery();
                                _openGallery();
                                Navigator.pop(context, _image);
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text(' 照相机'),
                              onPressed: () {
                                _pickImageFromCamera();
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
