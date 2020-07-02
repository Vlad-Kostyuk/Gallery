import 'dart:convert';
import 'package:http/http.dart' as http;


class Office {
  final String author;
  final String name;
  final String image;

  Office({this.author,this.name, this.image});

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
        author: json['user']['username'].toString(),
        name: json['alt_description'].toString(),
        image: json['urls']['small'].toString()
    );
  }
}

Future<Office> getOfficesList() async {
  const url = 'http://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';
  final response = await http.get(url);
    if(response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return Office.fromJson(jsonResponse[0]);
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
}