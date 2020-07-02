import 'package:flutter/material.dart';


class PageFoto extends StatelessWidget {
  final String fotoUrlFull;

  PageFoto(this.fotoUrlFull);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Gallery"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Image.network(this.fotoUrlFull, loadingBuilder: (BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
             if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator(value: loadingProgress.expectedTotalBytes != null? loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes: null)
              );
          }),
      ),
    );
  }
}

