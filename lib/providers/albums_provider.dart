import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:assignment_3/models/albums_model.dart';

class AlbumsProvider with ChangeNotifier {

  final List<AlbumsModel> _data = [];

  List<AlbumsModel> get data => [..._data];

  Future<void> fetchPost () async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      // List<AlbumsModel> loadData = [];
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        jsonData.forEach((element) {
          final currentData = AlbumsModel(
            userId: element['userId'] ?? 0,
            id: element['id'] ?? 0,
            title: element['title'] ?? '',
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