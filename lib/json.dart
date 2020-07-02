import 'dart:convert';
import 'package:http/http.dart' as http;





class Office {
  final String userName;
  final String descriptionFoto;
  final String imageUrl;

  Office(this.userName,this.descriptionFoto, this.imageUrl);
}

  Future<List<Office>> get() async {
    var url = Uri.encodeFull('http://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');
    http.get(url);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var api = json.decode(response.body);

      List<Office> post = [];

      for(var i in api) {
        Office office = Office(i['user']['username'], i['alt_description'], i['urls']['small']);
        post.add(office);
      }
      return post;
    } else {
      throw Exception('Failed to load json data');
    }
  }
