import 'package:flutter/material.dart';
import 'package:plants_app/src/networking/family_network.dart';

import 'add_specimen_page.dart';

import '../utils/acacia.dart';
import '../widgets/bg_nav_bar.dart';
import '../widgets/species_card.dart';
import '../models/plant_species.dart';
import '../networking/species_network.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<PlantSpecies> speciesList = List();
  SpeciesNetwork speciesNetwork = SpeciesNetwork();
  FamilyNetwork familyNetwork = FamilyNetwork();

  _fetchSpecies() async {
    var res = await speciesNetwork.getAllSpecies();
    setState(() => speciesList = res);
  }

  @override
  void initState() {
    super.initState();
    _fetchSpecies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          appName,
          style:
              Theme.of(context).textTheme.title.copyWith(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _fetchSpecies),
        ],
      ),
      body: speciesList.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColorLight,
              ),
            )
          : ListView.builder(
              itemCount: speciesList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: SpeciesCard(plant: speciesList[index]),
                );
              },
            ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
