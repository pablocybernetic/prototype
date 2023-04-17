import 'package:flutter/material.dart';

import 'dob.dart';

class Names extends StatefulWidget {
  @override
  _NamesState createState() => _NamesState();
}

class _NamesState extends State<Names> {
  final _formKey = GlobalKey<FormState>();

  String _firstName = '';
  String _lastName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Set this to false to prevent the widget from shifting position when the keyboard is on
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
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'First name',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _firstName = value;
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Last name',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _lastName = value;
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(44.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Navigate to the next page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dob(
                                firstName: _firstName,
                                lastName: _lastName,
                              ),
                            ),
                          );
                        }
                      },
                      child:
                          Text('Next', style: TextStyle(color: Colors.white)),
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
