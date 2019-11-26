import 'package:flutter/material.dart';

import '../models/plant_species.dart';

class SpeciesCard extends StatelessWidget {
  final Species plant;

  const SpeciesCard({
    Key key,
    this.plant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image.network(
            plant.photo,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    plant.commonName,
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    plant.family.name,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    plant.description,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
