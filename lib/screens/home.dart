import 'package:cats_facts/screens/facts.dart';
import 'package:cats_facts/screens/images.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import '../model/facts.dart';
import '../remote_services/remote_services_facts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen": const CatImages(), "title": "Images"},
    {"screen": const Facts(), "title": "Facts"}
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]["title"]),
      ),
      body: _screens[_selectedScreenIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Images'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Facts'),
        ],
      ),
    ));
  }

  // showDataAlert() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(
  //                 20.0,
  //               ),
  //             ),
  //           ),
  //           contentPadding: EdgeInsets.only(
  //             top: 10.0,
  //           ),
  //           title: Text(
  //             "الترجمة",
  //             style: TextStyle(fontSize: 24.0),
  //           ),
  //           content: Container(
  //             height: 400,
  //             child: SingleChildScrollView(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Text(
  //                       (fact.translate(to: 'ar').toString()),
  //                       style: TextStyle(fontSize: 18),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
}
