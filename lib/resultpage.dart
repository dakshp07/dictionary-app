import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class ResultPage extends StatefulWidget {

  final String title;
  ResultPage({this.title});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  Map wordData;
  fetchData() async {
    http.Response response = await http.get("https://owlbot.info/api/v4/dictionary/"+widget.title,
        headers: {HttpHeaders.authorizationHeader : "{YOUR_API_KEY}"});
    setState(() {
      wordData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Your Word",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body:  wordData == null ? new Center(
        child: new CircularProgressIndicator(),
      ) : new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(wordData["word"],style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
              new Text(" ("+wordData["definitions"][0]["type"]+")",style: TextStyle(fontSize: 30,color: Colors.grey[600],fontWeight: FontWeight.bold),),
            ],
          ),
          new Padding(padding: const EdgeInsets.only(bottom: 10)),
          new Image.network(wordData["definitions"][0]["image_url"]),
          new Padding(padding: const EdgeInsets.only(bottom: 10)),
          new Text(wordData["definitions"][0]["definition"],style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
          new Padding(padding: const EdgeInsets.only(top: 10)),
          new RaisedButton(
            child: new Text("Go Back",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
            onPressed: (){
              Navigator.pop(context);
            },
            color: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }
}
