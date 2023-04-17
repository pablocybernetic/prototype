import 'package:flutter/cupertino.dart';

class RegistrationProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController registration_email = TextEditingController();
  TextEditingController registration_password = TextEditingController();
  TextEditingController registration_re_password = TextEditingController();
  TextEditingController phone_num = TextEditingController();
}
