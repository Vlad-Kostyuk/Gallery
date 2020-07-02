import 'dart:convert';
import 'package:gallery/post.dart';
import 'package:http/http.dart' as http;


  Future<List<Post>> getFoto() async {
    var url = Uri.encodeFull('http://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');
    http.get(url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonDecode = json.decode(response.body);
      List<Post> postList = [];
      //print(jsonDecode);

      for(var tmp in jsonDecode) {
        Post post = Post(tmp['user']['username'], tmp['alt_description'], tmp['urls']['small'], tmp['urls']['full']);
        postList.add(post);
      }

      return postList;
    } else {
      throw Exception('Failed to load json data');
    }
  }
