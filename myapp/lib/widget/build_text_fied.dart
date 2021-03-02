import 'package:flutter/material.dart';

class LoginTextField extends TextField {
  LoginTextField({
    Key key,
    String text,

    String placeholder,

    /// prefix icon
    bool prefixIconSelected,
    String prefixIconNormalImageName,
    String prefixIconSelectedImageName,

    bool autofocus = false,
    bool obscureText = false,
    TextInputType keyboardType,
    TextEditingController controller,
    bool showClear = false,
    TextInputAction textInputAction,
    FocusNode focusNode,
    ValueChanged<String> onSubmitted,
  }) : super(
      key: key,
      autofocus: autofocus,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black, fontSize: 17.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        //labelText: "用户名",
        hintText: placeholder,
        //prefixIcon: Icon(Icons.person),
        prefixIcon: new Image.asset(
          !prefixIconSelected ? prefixIconNormalImageName :prefixIconSelectedImageName,
          width: 14.0,
          height: 15.0,
        ),
        // suffixIcon: !showClear ? null : clearButtonWithOnPressed(controller.clear),
        enabledBorder: loginTextFieldDecorationBorder(),
        focusedBorder: loginTextFieldDecorationBorder(),
      ),
      keyboardType: keyboardType,
      controller: controller,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onSubmitted: onSubmitted
  );
}

/// selected Image
class SelectedImage extends Image {
  SelectedImage({
    Key key,
    bool selected,
    String normalImageName,
    String selectedImageName,
  }) :super (
      key: key,
      image: AssetImage(!selected ? normalImageName :selectedImageName)
  );
}


/// 文本框border
InputBorder loginTextFieldDecorationBorder() {
  return new OutlineInputBorder(
      borderSide: new BorderSide(color: Color(0xffd2d2d2), width: 0.6),
      borderRadius: new BorderRadius.circular(6.0)
  );
}