import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_login_page/Models/cases_model.dart';
import 'package:simple_login_page/Models/temp_model.dart';
import 'package:simple_login_page/add.dart';
import 'package:simple_login_page/edit.dart';
import 'package:simple_login_page/login_page.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<Users> _futureObject;
  @override
  void initState() {
    super.initState();

    _futureObject = fetchUsers();
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
      appBar: AppBar(
        title: Text("Cases"),
        leading: GestureDetector(
          onTap: () {
            // account details here
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Icon(
            Icons.account_circle, // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCase()));
                },
                child: Icon(
                  Icons.add,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Container(
          width: MediaQuery.of(context).copyWith().size.width,
          height: MediaQuery.of(context).copyWith().size.height,
          child: (_futureObject == null)
              ? Container(
                  child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddCase()));
                  },
                ))
              : FutureBuilder<Users>(
                  future: _futureObject,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text('' + snapshot.data.id.toString()),
                              subtitle: Text('Court:' +
                                  snapshot.data.username +
                                  ' Time:' +
                                  snapshot.data.phone +
                                  '\nParty Name:' +
                                  snapshot.data.email),
                              isThreeLine: true,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditCase()));
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
  print('Await here now');
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/'),
  );
  print('Await over');
  print('len =' + response.contentLength.toString());
  if (response.statusCode == 200) {
    // If the server did return a 200 response,
    // then parse the JSON.
    print("INSIDE HERE");
    print("RESPONSE");
    //debugPrint("" + response.body);

    for (int i = 0; i < jsonDecode(response.body)["cases"].length; i++) {
      var up = 0, down = 0;
      var jsonfile = jsonDecode(response.body)[i];
      print("JSON " + jsonfile);
      if (jsonDecode(response.body)["cases"][i] != null) {
        Cases temp = Cases.fromJson(jsonfile);
        objj.add(temp);
      }
      //print("" + jsonfile.toString());

    }

    for (int i = 0; i < jsonDecode(response.body).length; i++) {
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

Future<Users> fetchUsers() async {
  print('In the FUTURE1111111111');

  print('Await here now');
  final response = await http.get(
    Uri.parse('https://610fa79fc848c900171b3955.mockapi.io/api/test/Users/10'),
  );
  print('Await over');
  print('len =' + response.contentLength.toString());
  if (response.statusCode == 200) {
    // If the server did return a 200 response,
    // then parse the JSON.
    print("INSIDE HERE");
    print("RESPONSE" + response.body);
    //debugPrint("" + response.body);
    return Users.fromJson(jsonDecode(response.body));
    // for (int i = 0; i < jsonDecode(response.body).length; i++) {
    //   var jsonfile = jsonDecode(response.body)[i];
    //   print("JSON " + jsonfile);
    //   if (jsonDecode(response.body)[i] != null) {
    //     Users temp = Users.fromJson(jsonfile);
    //     objj.add(temp);
    //   }
    //   //print("" + jsonfile.toString());
    //
    // }

    // for (int i = 0; i < jsonDecode(response.body).length; i++) {
    //   print("parse +" + i.toString());
    //   print(objj.toString());
    // }

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create objects.');
  }
}
