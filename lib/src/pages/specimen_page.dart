import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/plant_specimen.dart';
import '../widgets/specimen_card.dart';

class SpecimenPage extends StatelessWidget {
  final List<PlantSpecimen> list;

  const SpecimenPage({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Especímenes',
            textAlign: TextAlign.center,
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(FontAwesomeIcons.spa),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.spa),
              ),
            ],
          ),
        ),
        body: list.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              )
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: SpecimenCard(specimen: list[index]),
                  );
                },
              ),
      ),
    );
  }
}
