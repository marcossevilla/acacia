import 'package:flutter/material.dart';

class CoolCard extends StatelessWidget {
  final String title;

  const CoolCard({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
