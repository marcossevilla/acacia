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
      // height: 55.0,
      child: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: currentIndex,
        onTap: onTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.listUl,
              size: 20.0,
              color: Theme.of(context).primaryColor,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.bell,
              size: 20.0,
              color: Theme.of(context).primaryColor,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.user,
              size: 20.0,
              color: Theme.of(context).primaryColor,
            ),
            title: Container(),
          ),
        ],
      ),
    );
  }
}
