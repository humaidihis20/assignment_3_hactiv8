import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:assignment_3/models/users_model.dart';

class UsersProvider with ChangeNotifier {

  final List<UsersModel> _data = [];

  List<UsersModel> get data => [..._data];

  Future<void> fetchPost () async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
     
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        for (var users in jsonData) {
          final currentData = UsersModel(
            id: users['id'] ?? 0,
            name: users['name'] ?? 0,
            username: users['username'] ?? '',
            email: users['email'] ?? '',
            address: users['address'] ?? '',
            phone: users['phone'] ?? '',
            website: users['website'] ?? '',
            company: users['company'] ?? '',
          );
          _data.add(currentData);
          // print(_data);
        }
        // for (var element in jsonData) {
        //   final currentData = TypecodeModel(
        //     userId: int.parse(element['userId'].toString()),
        //     id: int.parse(element['id'].toString()),
        //     title: element['title'] ?? '',
        //     body: element['body'] ?? '',
        //   );
        //   _posts.add(currentData);
        //   print(_posts);
        // }

        notifyListeners(); // Beritahu widget untuk memperbarui UI
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error: $e');
    }
  }
}