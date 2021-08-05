import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final DateTime currentDate = DateTime.now();

final DateTime first =
    new DateTime(currentDate.year, currentDate.month, currentDate.day - 2);
final DateTime last = new DateTime(currentDate.year, 12, 31);

final bool status = false;

var st, count, docid, fd, td, wll;
final String remarks = 'No remarks';

DateFormat df = new DateFormat('dd-MM-yyyy');
String reason;
int days;
DateTime endDate, startDate;

var casename = TextEditingController();
var court = TextEditingController();

var hearingDate = TextEditingController();
var resultVar = TextEditingController();
var caseNum = TextEditingController();
var partyName = TextEditingController();

class LeaveForm extends StatefulWidget {
  @override
  _LeaveFormState createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add cases'),
      ),
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: TextFormField(
              //     controller: court,
              //     decoration: const InputDecoration(
              //       hintText: 'Enter ',
              //       labelText: 'Starting date',
              //     ),
              //     onTap: () async {
              //       DateTime date = DateTime(2021);
              //       FocusScope.of(context).requestFocus(new FocusNode());
              //
              //       date = await showDatePicker(
              //         context: context,
              //         initialDate: currentDate,
              //         firstDate: first,
              //         lastDate: last,
              //       );
              //       court.text = df.format(date);
              //       print('00000000000000000000000000000000000000000000000000');
              //       print('00000000000000000000000000000000000000000000000000');
              //       print(court.text);
              //       print('00000000000000000000000000000000000000000000000000');
              //       print('00000000000000000000000000000000000000000000000000');
              //       setState(() {
              //         startDate = date;
              //       });
              //     },
              //     validator: (date) {
              //       if (date.isEmpty) {
              //         return 'Date cannot be empty';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: TextFormField(
              //     controller: time,
              //     decoration: const InputDecoration(
              //       hintText: 'Enter the ending date for your leave request',
              //       labelText: 'Ending Date',
              //     ),
              //     onTap: () async {
              //       DateTime date = DateTime(2021);
              //       FocusScope.of(context).requestFocus(new FocusNode());
              //
              //       date = await showDatePicker(
              //         context: context,
              //         initialDate: currentDate,
              //         firstDate: first,
              //         lastDate: last,
              //       );
              //       time.text = df.format(date);
              //       print('00000000000000000000000000000000000000000000000000');
              //       print('00000000000000000000000000000000000000000000000000');
              //       print(time.text);
              //       print('00000000000000000000000000000000000000000000000000');
              //       print('00000000000000000000000000000000000000000000000000');
              //       setState(() {
              //         endDate = date;
              //       });
              //     },
              //     validator: (date) {
              //       if (date.isEmpty) {
              //         return 'Date cannot be empty';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                    controller: casename,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Case Name',
                      labelText: 'Case Name',
                      helperText: 'Please enter Name of the case',
                    ),
                    validator: (reason) {
                      if (reason.isEmpty) {
                        return 'Case Name cannot be empty';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                    controller: caseNum,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Case number',
                      labelText: 'Case number',
                      helperText: 'Please enter number of the case',
                    ),
                    validator: (reason) {
                      if (reason.isEmpty) {
                        return 'Case number cannot be empty';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                    controller: partyName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Party Name',
                      labelText: 'Party Name',
                      helperText: 'Please enter Name of the Party',
                    ),
                    validator: (reason) {
                      if (reason.isEmpty) {
                        return 'Party Name cannot be empty';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                    controller: court,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Court Name',
                      labelText: 'Court Name',
                      helperText: 'Please enter Name of the Court',
                    ),
                    validator: (reason) {
                      if (reason.isEmpty) {
                        return 'Court Name cannot be empty';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: hearingDate,
                  decoration: const InputDecoration(
                    hintText: 'Enter Next Hearing date',
                    labelText: 'Hearing date',
                  ),
                  onTap: () async {
                    DateTime date = DateTime(2021);
                    FocusScope.of(context).requestFocus(new FocusNode());

                    date = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: first,
                      lastDate: last,
                    );
                    court.text = df.format(date);
                    print('00000000000000000000000000000000000000000000000000');
                    print('00000000000000000000000000000000000000000000000000');
                    print(court.text);
                    print('00000000000000000000000000000000000000000000000000');
                    print('00000000000000000000000000000000000000000000000000');
                    setState(() {
                      startDate = date;
                    });
                  },
                  validator: (date) {
                    if (date.isEmpty) {
                      return 'Date cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                    controller: resultVar,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Result',
                      labelText: 'Result',
                      helperText: 'Please enter Result of the case',
                    ),
                    validator: (reason) {
                      if (reason.isEmpty) {
                        return 'Result cannot be empty';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 100, right: 100, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                      child: const Text('Submit'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a Snackbar.
                          reason = casename.text;
                          String val = "";
                          if (val != null) {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text('Data is in processing.')));
                            await new Future.delayed(new Duration(seconds: 4));
                            casename.clear();
                            court.clear();
                            hearingDate.clear();
                            Navigator.pop(context);
                          }
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
