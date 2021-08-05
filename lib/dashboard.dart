import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_login_page/Models/cases_model.dart';
import 'package:simple_login_page/detail_screen.dart';
import 'package:simple_login_page/login_page.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<List<Cases>> _futureObject;
  @override
  void initState() {
    super.initState();

    _futureObject = fetchObjects();
  }

  @override
  Widget build(BuildContext context) {
    final buttonLogout = FlatButton(
        child: Text(
          'Logout',
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        });

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('Cases')),
      body: Container(
          width: MediaQuery.of(context).copyWith().size.width,
          height: MediaQuery.of(context).copyWith().size.height,
          child: (_futureObject == null)
              ? Container()
              : FutureBuilder<List<Cases>>(
                  future: _futureObject,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text('' + snapshot.data[index].caseName),
                              subtitle: Text('Court:' +
                                  snapshot.data[index].court +
                                  ' Time:' +
                                  snapshot.data[index].time +
                                  '\nParty Name:' +
                                  snapshot.data[index].partyName),
                              isThreeLine: true,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detailScreen()));
                              },
                            );
                          });
                    } else {
                      return Container();
                    }
                  },
                )),
      // ListView(
      //   padding: EdgeInsets.symmetric(horizontal: 20),
      //   children: <Widget>[
      //     ListTile(
      //       title: Text('Case_Name'),
      //       subtitle: Text(
      //           'Court:_________ Time:dd/mm/yyyy-hh:mm \nParty Name:________________'),
      //       isThreeLine: true,
      //       onTap: () {
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => detailScreen()));
      //       },
      //     ),
      //   ],
      // ),
    ));
  }
}

Future<List<Cases>> getCases(String URL) async {
  try {
    final result = await Dio().get(URL);
    print(result.toString());
    return (result.data as List).map((json) => Cases.fromJson(json)).toList();
  } catch (e, stacktrace) {
    print('error' + stacktrace.toString());
  }
}

Future<List<Cases>> fetchObjects() async {
  print('In the FUTURE1111111111');
  List<Cases> objj;
  final response = await http.post(
    Uri.https('localhost:4000', 'cases'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
    },
  );
  print('len =' + response.contentLength.toString());
  if (response.statusCode == 200) {
    // If the server did return a 200 response,
    // then parse the JSON.
    print("INSIDE HERE");
    print("RESPONSE");
    //debugPrint("" + response.body);

    for (int i = 0; i < jsonDecode(response.body)['result'].length; i++) {
      var up = 0, down = 0;
      var jsonfile = jsonDecode(response.body)['result'][i];
      print("JSON " + jsonfile);
      if (jsonDecode(response.body)['result'][i] != null) {
        Cases temp = Cases.fromJson(jsonfile);
        objj.add(temp);
      }
      //print("" + jsonfile.toString());

    }

    for (int i = 0; i < jsonDecode(response.body)['result'].length; i++) {
      print("parse +" + i.toString());
      print(objj.toString());
    }
    return objj;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create objects.');
  }
}
