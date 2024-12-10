import 'package:flutter/material.dart';

class CardUsers extends StatelessWidget {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map<String, dynamic> address;
  final String phone;
  final String website;
  final Map<String, dynamic> company;

  // ignore: use_super_parameters
  const CardUsers({
    Key? key,
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
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
                  'https://access.amartha.com/uploads/fakta_pemain_bola_45b34823dd.jpg',
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
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    const Padding(  
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Text(
                      username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    const Padding(  
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    const Padding(  
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Text(
                      phone,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    const Padding(  
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Text(
                      website,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    const Padding(  
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    // Text(
                    //   company as String,
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 15
                    //   ),
                    // ),
                    // const Padding(  
                    //   padding: EdgeInsets.symmetric(vertical: 2.0),
                    // ),
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