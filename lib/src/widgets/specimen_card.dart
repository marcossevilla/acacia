import 'package:flutter/material.dart';
import 'package:plants_app/src/models/plant_specimen.dart';

class SpecimenCard extends StatelessWidget {
  final PlantSpecimen specimen;

  const SpecimenCard({Key key, this.specimen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(
            specimen.photoURL,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Text(
                  specimen.species.commonName,
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 10.0),
                Text(
                  specimen.family.name,
                  style: Theme.of(context).textTheme.subhead,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Registrado por: ${specimen.recolector.name}',
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}