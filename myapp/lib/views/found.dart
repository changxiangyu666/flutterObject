import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Builder(
        builder: (BuildContext context) {
          return Center(
            child: RaisedButton(
                child: Text('Like my Work ?'),
                onPressed: () {
                  containerForSheet<String>(
                    context: context,
                    child: CupertinoActionSheet(
                        title: const Text('标题'),
                        message: const Text('这里是消息'),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: const Text('🙋 Yes'),
                            onPressed: () {
                              Navigator.pop(context, '🙋 Yes');
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text('🙋 No'),
                            onPressed: () {
                              Navigator.pop(context, '🙋 No');
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text("🙋 Can't say"),
                            onPressed: () {
                              Navigator.pop(context, "🙋 Can't say");
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text("🙋 Decide in next post"),
                            onPressed: () {
                              Navigator.pop(context, "🙋 Decide in next post");
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
          );
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
