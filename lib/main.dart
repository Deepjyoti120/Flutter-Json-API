import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) async {
  List _data = await getjson();
  for (int i = 0; i < _data.length; i++)
    runApp(MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("JSON DATA"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: new ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int position) {
            return Column(
              children: <Widget>[
                Divider(
                  height: 5.0,
                ),
                ListTile(
                  title: Text(_data[position]["title"]),
                  leading: CircleAvatar(
                    child: new Text(_data[position]["title"][0]),
                  ),
                  onTap: () => showbar(context, _data[position]["title"]),
                ),
              ],
            );
          },
        ),
      ),
    ));
}

void showbar(BuildContext context, String messages) {
  var alertbox = AlertDialog(
    title: new Text(messages),
    actions: <Widget>[
      FlatButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text("OK"),
      ),
      FlatButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text("Done"),
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (context) {
        return alertbox;
      });
}

Future<List> getjson() async {
  String apiurl = "https://jsonplaceholder.typicode.com/posts";
  http.Response apires = await http.get(apiurl);
  return jsonDecode(apires.body);
}
