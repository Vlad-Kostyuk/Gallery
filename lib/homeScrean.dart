import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  List<String> litems = ["fdfd", "dffdfdfd", "dfdfdfdfd"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Gallery"),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),

          body: ListView.builder(
            itemCount: litems.length,
            itemBuilder: (BuildContext bc, int index) {
             return new Text(litems[index]);
            }
          ),

        ),
    );
  }
}