import 'package:flutter/material.dart';
import 'resultpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController t1 = new TextEditingController(text: "");

  void clear(){
    t1.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Dictionary App",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Image.asset("assests/romain-vignes-ywqa9IZB-dU-unsplash.jpg",width: 1080,height: 300,),
            new Container(
              padding: const EdgeInsets.all(20),
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Enter The Word",
                  labelStyle: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.text,
                controller: t1,
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  child: new Text("Search",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ResultPage(title: t1.text)));
                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.all(10),
                ),
                new RaisedButton(
                  child: new Text("Clear",style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),),
                  onPressed: clear,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.all(10),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}

