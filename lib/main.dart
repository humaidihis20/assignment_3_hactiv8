import 'package:assignment_3/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/home.dart';
import '../providers/typecode_provider.dart';
import '../providers/albums_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TypecodeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AlbumsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UsersProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Assignment 3',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
