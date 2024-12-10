import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:assignment_3/models/typecode_model.dart';

class TypecodeProvider with ChangeNotifier {

  final List<TypecodeModel> _data = [];

  List<TypecodeModel> get data => [..._data];

  Future<void> fetchPost () async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      // List<TypecodeModel> loadData = [];
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        jsonData.forEach((element) {
          final currentData = TypecodeModel(
            userId: element['userId'] ?? 0,
            id: element['id'] ?? 0,
            title: element['title'] ?? '',
            body: element['body'] ?? '',
          );
          _data.add(currentData);
          // print(_data);
        });
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