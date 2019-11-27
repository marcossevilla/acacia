import 'package:flutter/material.dart';

import '../widgets/bg_nav_bar.dart';

import 'no_login_page.dart';
import 'specimen_page.dart';
import 'add_specimen_page.dart';
import 'notification_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _loadPage(currentIndex),
      bottomNavigationBar: BigBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => AddSpecimen(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _loadPage(int index) {
    switch (index) {
      case 0:
        return SpecimenPage();
      case 1:
        return NotificationPage();
      case 2:
        return NoLoginPage();
      default:
        return SpecimenPage();
    }
  }
}