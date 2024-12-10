import 'package:flutter/material.dart';

class CardAlbums extends StatelessWidget {
  final int userId;
  final int id;
  final String title;

  // ignore: use_super_parameters
  const CardAlbums({
    Key? key,
    required this.userId,
    required this.id,
    required this.title,
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
                  'https://cdn0-production-images-kly.akamaized.net/utagdMMAEF1Qn37wveJIP9N2jtc=/1200x675/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3141796/original/042682000_1591087158-ball-2215958_1280.jpg',
                  scale: 0.2,
                  fit: BoxFit.cover,
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