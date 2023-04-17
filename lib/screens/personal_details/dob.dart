import 'package:flutter/material.dart';
import 'gender.dart';

class Dob extends StatefulWidget {
  final String firstName;
  final String lastName;

  const Dob({required this.firstName, required this.lastName});

  @override
  _DobState createState() => _DobState();
}

class _DobState extends State<Dob> {
  final _formKey = GlobalKey<FormState>();

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('My Form', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage('assets/images/ent.png'),
              //     fit: BoxFit.fitWidth,
              //   ),
              ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    child: Column(
                      children: [
                        Text(
                          "Select Date of Birth",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: _selectedDate,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2030),
                                  );
                                  if (date != null) {
                                    setState(() {
                                      _selectedDate = date;
                                    });
                                  }
                                },
                                child: Text(
                                  _selectedDate.day == null
                                      ? 'Select a date'
                                      : '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Back"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Gender(
                            firstName: widget.firstName,
                            lastName: widget.lastName,
                            dob: _selectedDate,
                          ),
                        ),
                      );
                    },
                    child: Text("Next"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
