import 'dart:convert';
import 'package:gallery/Post.dart';
import 'package:http/http.dart' as http;


  Future<List<Post>> get() async {
    var url = Uri.encodeFull('http://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');
    http.get(url);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var api = json.decode(response.body);

      List<Post> postList = [];

      for(var i in api) {
        Post post = Post(i['user']['username'], i['alt_description'], i['urls']['small']);
        postList.add(post);
      }
      return postList;
    } else {
      throw Exception('Failed to load json data');
    }
  }
