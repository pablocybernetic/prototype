import 'package:flutter/material.dart';

class ChangePasswordProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController change_password = TextEditingController();
  TextEditingController change_new_pass = TextEditingController();
  TextEditingController change_re_new_pass = TextEditingController();
}
