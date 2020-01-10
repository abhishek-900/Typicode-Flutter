import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rodo_assignment/model/post.dart';
import 'package:rodo_assignment/model/user_info.dart';

class LandingData {

  List<Post> _item = [];
  List<User> _user = [];
  List<Post> _postById=[];

  List<Post> get item {
    return [..._item];
  }

  List<User> get user {
    return [..._user];
  }
  List<Post> get postById {
    return [..._postById];
  }

  Future<void> fetchPost() async {
    const url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as List<dynamic>;
    for (var u in extractedData) {
      Post p = Post(
          userId: u["userid"], body: u["body"], title: u["title"], id: u["id"]);
     _item.add(p);
    }}


  Future<void> postFindById(int id)async{
    final url = "https://jsonplaceholder.typicode.com/posts?userId=$id";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as List<dynamic>;
    for (var u in extractedData) {
      Post p = Post(
          userId: u["userid"], body: u["body"], title: u["title"], id: u["id"]);
      _postById.add(p);
    }}

 /* Future<void> fetchPhotos() async {
    const url = "https://jsonplaceholder.typicode.com/photos";
    final response = await http.get(url);
    print(json.decode(response.body));
  }

  Future<void> sendPost() async {
    const url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.post(url);
    print(json.decode(response.body));
  }*/



  Future<void> fetchUser() async {
    List<User> _loadedUser = [];
    const url = "https://jsonplaceholder.typicode.com/users";
    final response = await http.get(url);

    final extractedData = json.decode(response.body) as List<dynamic>;

    for (Map i in extractedData) {
      User u = User.fromJson(i);
      _loadedUser.add(u);
    }
    _user = _loadedUser;

  }



}
