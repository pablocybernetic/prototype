import 'package:prototype/utility/constant.dart';
import 'package:flutter/material.dart';

Widget reg_email_textformfield(
    String hint_text, Icon prefix_icon, TextEditingController reg_email) {
  return TextFormField(
    controller: reg_email,
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

Widget reg_password_textFormField(
    String hint_text, TextEditingController reg_password) {
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

Widget reg_re_password_textFormField(
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

Widget reg_phone_number(TextEditingController phone_num) {
  return TextFormField(
    controller: phone_num,
    validator: (value) {
      if (value!.isEmpty) {
        return "PLease Enter Your Password";
      } else {
        return null;
      }
    },
    keyboardType: TextInputType.number,
    style: TextStyle(color: Style.black),
    decoration: InputDecoration(
      hintText: 'Enter Phone Number',
      hintStyle: TextStyle(color: Style.grey),
      prefixIcon: Icon(
        Icons.phone,
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
