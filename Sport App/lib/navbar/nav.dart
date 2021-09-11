import 'package:flutter/material.dart';
import 'package:spor_app/navbar/activity.dart';
import 'package:spor_app/navbar/dashboard.dart';
import 'package:spor_app/navbar/leaderboard.dart';
import 'package:spor_app/navbar/dashboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spor_app/navbar/map.dart';

var userId = "";

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  int _selectedIndex = 0;

  List<Widget> _widgetOption = <Widget>[
    MapScreen(),
    Dashboard(),
    Activity(),
    Leaderboard(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sport App'),
      ),
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.running), title: Text('Başla')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Dashboard')),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), title: Text('Aktivite')),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard), title: Text('Leaderboard')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
