import 'package:flutter/material.dart';
import 'package:gallery/Post.dart';
import 'package:gallery/json.dart';
import 'package:gallery/PageFoto.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  Future<List<Post>> postList;

  @override
  void initState() {
    super.initState();
    postList = get();
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
          child: FutureBuilder<List<Post>>(
            future: postList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: ListTile(
                        title: Text(snapshot.data[index].userName),
                        subtitle: Text(snapshot.data[index].descriptionFoto),
                        leading: Image.network('${snapshot.data[index].imageUrlSmall}',
                          width: 50,
                          height: 50,
                          fit: BoxFit.fitWidth,
                        ),
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => PageFoto(snapshot.data[index].imageUrlFull)));
                        },
                        isThreeLine: true
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
