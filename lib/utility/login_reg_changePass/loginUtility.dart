import 'package:prototype/utility/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextEditingController(
    String hint_text, Icon prefix_icon, TextEditingController controller_name) {
  return TextFormField(
    controller: controller_name,
    validator: (value) {
      if (value!.isEmpty) {
        return "PLease Enter Your Email";
      }
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return "Please enter a valid email address";
      } else {
        return null;
      }
    },
    style: TextStyle(color: Style.black),
    decoration: InputDecoration(
      hintText: hint_text,
      hintStyle: TextStyle(color: Style.grey),
      prefixIcon: prefix_icon,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Style.grey),
        borderRadius: BorderRadius.circular(20.0),
      ),
      border: new OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: new BorderSide(color: Style.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(width: 1, color: Style.grey),
      ),
    ),
  );
}

Widget password_textFormField(String hint_text,
    TextEditingController controller_password, Icon pref_icon) {
  return TextFormField(
    controller: controller_password,
    validator: (value) {
      if (value!.isEmpty) {
        return "PLease Enter Your Password";
      }
      if (!RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(value)) {
        return "Please enter a valid Password";
      } else {
        return null;
      }
    },
    obscureText: true,
    style: TextStyle(color: Style.black),
    decoration: InputDecoration(
      hintText: hint_text,
      hintStyle: TextStyle(color: Style.grey),
      prefixIcon: pref_icon,

      // Icon(
      //   Icons.lock,
      //   color: Style.grey,
      // ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Style.grey),
        borderRadius: BorderRadius.circular(20.0),
      ),
      border: new OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: new BorderSide(color: Style.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(width: 1, color: Style.white),
      ),
    ),
  );
}
