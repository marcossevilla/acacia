import 'package:flutter/material.dart';
import 'package:plants_app/src/widgets/species_card.dart';

class SpeciesPage extends StatelessWidget {
  final List list;

  const SpeciesPage({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
          )
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: SpeciesCard(plant: list[index]),
              );
            },
          );
  }
}
