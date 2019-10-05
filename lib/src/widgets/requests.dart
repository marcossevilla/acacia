import 'package:flutter/material.dart';
import 'package:plants_app/src/models/plant.dart';
import 'package:plants_app/src/widgets/cool_card.dart';

class Requests extends StatelessWidget {
  final List<Plant> requests = [
    Plant('African Violet'),
    Plant('Bird Of Paradise'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, i) => CoolCard(
        title: requests[i].name,
      ),
    );
  }
}
