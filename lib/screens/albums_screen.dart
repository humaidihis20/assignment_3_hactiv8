import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/albums_provider.dart';

import '../widgets/albums_card.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<AlbumsScreen> {
  // bool _init = true;
  // // ignore: unused_field
  // bool _isLoading = false;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   if (_init) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //   Provider.of<TypecodeProvider>(context)
  //     .fetchPost()
  //     .then((_) {})
  //     .catchError((err) {
        
  //     })
  //     .whenComplete(
  //       () {
  //         _init = false;
  //         setState(() {
  //           _isLoading = false;
  //         });
  //       }
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: const Text("Post parsing"),
      ),
      body: FutureBuilder(
        future: Provider.of<AlbumsProvider>(context, listen: false).fetchPost(),
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
              return Consumer<AlbumsProvider>(
                builder: (ctx, fetch, ch) {
                  final guitarDatas = fetch.data;
                  return ListView(
                    children: guitarDatas.map(
                      (posts) => CardAlbums(
                        key: ValueKey(posts.id),
                        userId: posts.userId, 
                        id: posts.id, 
                        title: posts.title, 
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