import 'package:flutter/material.dart';

class CardPost extends StatelessWidget {
  final int userId;
  final int id;
  final String title;
  final String body;

  // ignore: use_super_parameters
  const CardPost({
    Key? key,
    required this.userId,
    required this.id,
    required this.title,
    required this.body
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(166, 174, 191, 0),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 70,
                padding: const EdgeInsets.all(0),
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                    
                ),
              )
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    const Padding(  
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Text(
                      body,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}