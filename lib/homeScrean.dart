import 'package:flutter/material.dart';
import 'package:gallery/json.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {


  Future<List<Office>> office;

  @override
  void initState() {
    super.initState();
    office = get();
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
        body: Center(
          child: FutureBuilder<List<Office>>(
          future: office,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                   itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: ListTile(
                            title: Text(snapshot.data[index].userName),
                            subtitle: Text(snapshot.data[index].descriptionFoto),
                            leading: Image.network('${snapshot.data[index].imageUrl}'),
                          isThreeLine: true,
                        ),
                      );
                    },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}