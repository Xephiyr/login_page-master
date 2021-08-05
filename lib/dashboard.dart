import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

    _futureObject = getCases('0.0.0.0:4000/cases');
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
  } catch (e, stacktrace) {}
}
