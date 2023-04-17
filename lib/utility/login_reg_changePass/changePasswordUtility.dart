import 'package:prototype/utility/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget change_pass(String hint_text, TextEditingController reg_password) {
  return TextFormField(
    controller: reg_password,
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
      prefixIcon: Icon(
        Icons.lock,
        color: Style.grey,
      ),
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

Widget change_new_pass(
    String hint_text, TextEditingController reg_re_password) {
  return TextFormField(
    controller: reg_re_password,
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
      prefixIcon: Icon(
        Icons.lock,
        color: Style.grey,
      ),
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

Widget change_re_new_pass(
    String hint_text, TextEditingController reg_re_password) {
  return TextFormField(
    controller: reg_re_password,
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
      prefixIcon: Icon(
        Icons.lock,
        color: Style.grey,
      ),
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
