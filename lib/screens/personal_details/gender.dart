import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/view/homePage.dart';

class Gender extends StatefulWidget {
  final String firstName;
  final String lastName;
  final DateTime dob;

  const Gender({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.dob,
  }) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedGender;
  late SharedPreferences _prefs;
  late String _firstName;
  late String _lastName;
  late String _dob;

  @override
  void initState() {
    super.initState();
    _initPrefs();
    _firstName = widget.firstName;
    _lastName = widget.lastName;
    _dob = widget.dob.toIso8601String();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // Set this to false to prevent the widget from shifting position when the keyboard is on
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('My Form', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        // Wrap your Scaffold with a SingleChildScrollView widget
        child: Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage('assets/images/ent.png'),
              //   fit: BoxFit.fitWidth,
              // ),
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.7,
              ),
              Container(
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.height / 2.5,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 52, 88, 250).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Select your gender',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 8.0),
                          RadioListTile(
                            title: Text(
                              'Male',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: 'male',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value as String?;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              'Female',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: 'female',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value as String?;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              'Others',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: 'others',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value as String?;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(44.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Go back to the previous screen
                        Navigator.pop(context);
                      },
                      child:
                          Text('Back', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(44.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            _selectedGender != null) {
                          // Save variables to shared preferences
                          await _prefs.setString(
                              'selectedGender', _selectedGender!);
                          await _prefs.setString('firstName', _firstName);
                          await _prefs.setString('lastName', _lastName);
                          await _prefs.setString('dob', _dob);
                          // Submit the form
                          print('Selected gender: $_selectedGender');
                          // Go to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      },
                      child:
                          Text('Finish', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
