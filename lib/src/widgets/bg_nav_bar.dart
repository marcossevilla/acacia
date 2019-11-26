import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BigBottomNavBar extends StatelessWidget {
  const BigBottomNavBar({
    Key key,
    @required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.0,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.leaf, size: 20.0),
            title: Text('Especimenes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.seedling, size: 20.0),
            title: Text('Especies'),
          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.person, size: 20.0),
//            title: Text('Recolectores'),
//          ),
        ],
      ),
    );
  }
}
