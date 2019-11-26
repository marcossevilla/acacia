import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/plant_specimen.dart';
import '../networking/specimen_network.dart';
import '../widgets/specimen_card.dart';

class SpecimenPage extends StatefulWidget {
  @override
  _SpecimenPageState createState() => _SpecimenPageState();
}

class _SpecimenPageState extends State<SpecimenPage> {
  List<PlantSpecimen> plants = List();
  SpecimenNetwork specimenNetwork = SpecimenNetwork();

  _fetchSpecimens() async {
    var _plants = await specimenNetwork.getAllSpecimens();
    setState(() {
      plants = _plants;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchSpecimens();
  }

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
        body: TabBarView(
          children: <Widget>[
            Container(
              child: plants.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    )
                  : ListView.builder(
                      itemCount: plants.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          child: SpecimenCard(specimen: plants[index]),
                        );
                      },
                    ),
            ),
            Container(
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
