import 'package:flutter/material.dart';

import '../models/plant_specimen.dart';
import '../widgets/specimen_card.dart';
import '../search/search_delegate.dart';
import '../networking/specimen_network.dart';

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
  void setState(fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Plantas'),
              Tab(text: 'Hongos'),
            ],
          ),
          elevation: 0.0,
          title: Text(
            "Especimenes",
            style: Theme.of(context).textTheme.title.copyWith(
                  color: Colors.white,
                ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SpecimenSearch());
              },
            )
          ],
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
