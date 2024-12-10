// import 'package:assignment_3/models/typecode_model.dart';
// import 'package:assignment_3/widgets/card.dart';
import 'package:assignment_3/screens/albums_screen.dart';
import 'package:assignment_3/screens/users_screen.dart';
import 'package:flutter/material.dart';
import '../screens/post_screen.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PostScreen(),
    AlbumsScreen(),
    UsersScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 75),
        child: AppBar(
          elevation: 0.0,
          centerTitle: false,
          title: const Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'POST API',
                  textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'DEMO',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 15),
                ),
              ),
            ],
          ),
            backgroundColor: Colors.blueGrey,
        ),
      ),
      body: Center(
          child: _widgetOptions.elementAt(currentPageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Posts',
            backgroundColor: Colors.redAccent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Albums',
            backgroundColor: Colors.greenAccent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Users',
            backgroundColor: Colors.purple
          ),
        ],
        currentIndex: currentPageIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return Scaffold(
//       bottomNavigationBar:  NavigationBar(
        
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPageIndex = index;
//           });
//           // ignore: unused_label
//           onTap: _onItemTapped;
//         },
//         indicatorColor: Colors.amber,
//         selectedIndex: currentPageIndex,
//         destinations: const <Widget>[
//           NavigationDestination(
//             selectedIcon: Icon(Icons.home),
//             icon: Icon(Icons.home_outlined),
//             label: 'Post',
//           ),
//           NavigationDestination(
//             icon: Badge(child: Icon(Icons.notifications_sharp)),
//             label: 'Albums',
//           ),
//           NavigationDestination(
//             icon: Badge(
//               label: Text('2'),
//               child: Icon(Icons.messenger_sharp),
//             ),
//             label: 'Users',
//           ),
//         ],
//       ),
//       body: <Widget>[
//         Center(
//           child: _widgetOptions.elementAt(currentPageIndex),
//         ),
//         /// Home page

//         /// Messages page
//         ListView.builder(
//           reverse: true,
//           itemCount: 2,
//           itemBuilder: (BuildContext context, int index) {
//             if (index == 0) {
//               return Align(
//                 alignment: Alignment.centerRight,
//                 child: Container(
//                   margin: const EdgeInsets.all(8.0),
//                   padding: const EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: theme.colorScheme.primary,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Text(
//                     'Hello',
//                     style: theme.textTheme.bodyLarge!
//                         .copyWith(color: theme.colorScheme.onPrimary),
//                   ),
//                 ),
//               );
//             }
//             return Align(
//               alignment: Alignment.centerLeft,
//               child: Container(
//                 margin: const EdgeInsets.all(8.0),
//                 padding: const EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   color: theme.colorScheme.primary,
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Text(
//                   'Hi!',
//                   style: theme.textTheme.bodyLarge!
//                       .copyWith(color: theme.colorScheme.onPrimary),
//                 ),
//               ),
//             );
//           },
//         ),
//       ]
//       [currentPageIndex],
//     );
//   }
// }