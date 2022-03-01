// ignore_for_file: non_constant_identifier_names, empty_constructor_bodies

import 'dart:convert';

import 'package:demo_riverpod_api/Model/User_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final DataFuture = ChangeNotifierProvider((ref) => FetchDataFromApi());

class FetchDataFromApi extends ChangeNotifier {
  FetchDataFromApi() {
    GetData();
  }

  final String url = 'https://jsonplaceholder.typicode.com/users';

  List<User> user = [];
  Future<List<User>> GetData() async {
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);

    for (int i = 0; i < data.length; i++) {
      user.add(User.fromJson(data[i]));
    }

    return user;
  }

  // Future<void> printData() async {
  //   http.Response response = await http.get(Uri.parse(url));
  //   var data = jsonDecode(response.body);

  //   List<User> user = [];
  //   for (int i = 0; i < data.length; i++) {
  //     user.add(User.fromJson(data[i]));
  //   }
  //   print(user[1].address!.city);
  // }
}
