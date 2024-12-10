import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/users_provider.dart';

import '../widgets/users_card.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: const Text("Post parsing"),
      ),
      body: FutureBuilder(
        future: Provider.of<UsersProvider>(context, listen: false).fetchPost(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState ==  ConnectionState.waiting) {
            return const Center(
             child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return const Center(
                child: Text(
                  'cannot process data!!',
                  style: TextStyle(color: Colors.redAccent),
                ),
              );
            } else {
              return Consumer<UsersProvider>(
                builder: (ctx, fetch, ch) {
                  final dataUsers = fetch.data;
                  return ListView(
                    children: dataUsers.map(
                      (posts) => CardUsers(
                        key: ValueKey(posts.id),
                        id: posts.id, 
                        name: posts.name, 
                        username: posts.username, 
                        email: posts.email, 
                        address: posts.address, 
                        phone: posts.phone, 
                        website: posts.website, 
                        company: posts.company, 
                      )
                    ).toList(),
                  );
                }
              );
            }
          }
        },
      ),
    );
  }
}