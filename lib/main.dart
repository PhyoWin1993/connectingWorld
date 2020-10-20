import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  List _getData = await getJson();

  print(_getData[0]);
  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: Text("Flutter"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView.builder(
          itemCount: _getData.length,
          itemBuilder: (BuildContext context, int position) {
            return Column(
              children: <Widget>[
                Divider(
                  height: 3.4,
                ),
                ListTile(
                    title: Text("Title : ${_getData[position]['title']}",
                        style: TextStyle(
                          fontSize: 17.3,
                          fontWeight: FontWeight.bold,
                        )),
                    subtitle: Text(_getData[position]['body']),
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text("Hello"),
                    ),
                    //
                    // onTap: () => print(_getData[position]['id'].toString()),
                    onTap: () =>
                        showTapMs(context, _getData[position]['title']))
              ],
            );
          }),
    ),
  ));

  //
}

Future<List> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  http.Response respone = await http.get(apiUrl);
  return json.decode(respone.body);
}

void showTapMs(BuildContext context, String message) {
  var alertMsDialog = new AlertDialog(
    title: Text(message),
    actions: <Widget>[
      FlatButton(
        onPressed: () => debugPrint("Ok Pressed."),
        child: Text("OK"),
      ),
    ],
  );

  showDialog(
      context: context,
      builder: (context) {
        return alertMsDialog;
      });
}
