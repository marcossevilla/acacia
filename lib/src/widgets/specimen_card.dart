import 'package:flutter/material.dart';
import 'package:plants_app/src/models/plant_specimen.dart';

class SpecimenCard extends StatelessWidget {
  final PlantSpecimen specimen;

  const SpecimenCard({Key key, this.specimen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          // Image.network(
          //   specimen.photo,
          //   fit: BoxFit.fill,
          // ),
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
                Text('${specimen.description}'),
                Text('${specimen.location}'),
                Text('${specimen.dateReceived.year}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      '${specimen.user.firstName + ' ' + specimen.user.lastName}',
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
