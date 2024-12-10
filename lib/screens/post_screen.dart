import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/typecode_provider.dart';

import '../widgets/card.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
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
        future: Provider.of<TypecodeProvider>(context, listen: false).fetchPost(),
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
              return Consumer<TypecodeProvider>(
                builder: (ctx, fetch, ch) {
                  final guitarDatas = fetch.data;
                  return ListView(
                    children: guitarDatas.map(
                      (posts) => CardPost(
                        key: ValueKey(posts.id),
                        userId: posts.userId, 
                        id: posts.id, 
                        title: posts.title, 
                        body: posts.body, 
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