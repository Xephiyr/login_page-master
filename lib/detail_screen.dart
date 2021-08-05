import 'package:flutter/material.dart';

class detailScreen extends StatefulWidget {
  @override
  _detailScreenState createState() => _detailScreenState();
}

var dateCntrlr = TextEditingController();

class _detailScreenState extends State<detailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: dateCntrlr,
              decoration: const InputDecoration(
                hintText: 'Enter the starting date for your request ',
                labelText: 'Starting date',
              ),
              onTap: () async {
                DateTime date = DateTime(2021);
                FocusScope.of(context).requestFocus(new FocusNode());

                date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1),
                );

                print('00000000000000000000000000000000000000000000000000');
                print('00000000000000000000000000000000000000000000000000');
                print(dateCntrlr.text);
                print('00000000000000000000000000000000000000000000000000');
                print('00000000000000000000000000000000000000000000000000');
                setState(() {
                  dateCntrlr.text = date.toString();
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
        ),
      ),
    );
  }
}
