import 'package:flutter/material.dart';
import 'package:plants_app/src/models/plant_specimen.dart';
import 'package:plants_app/src/models/recolector.dart';
import 'package:plants_app/src/networking/recolector_network.dart';
import 'package:plants_app/src/networking/specimen_network.dart';
import 'package:plants_app/src/pages/specimen_page.dart';

import 'add_specimen_page.dart';

import '../utils/acacia.dart';
import '../pages/species_page.dart';
import '../widgets/bg_nav_bar.dart';
import '../models/plant_species.dart';
import '../pages/recolector_page.dart';
import '../networking/family_network.dart';
import '../networking/species_network.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<PlantSpecies> speciesList = List();
  List<PlantSpecimen> specimens = List();
  SpeciesNetwork speciesNetwork = SpeciesNetwork();
  SpecimenNetwork specimenNetwork = SpecimenNetwork();
  FamilyNetwork familyNetwork = FamilyNetwork();
  List<Recolector> recolectors = List();
  RecolectorNetwork recolectorNetwork = RecolectorNetwork();

  _fetchData() async {
    var sps = await speciesNetwork.getAllSpecies();
    var spc = await specimenNetwork.getAllSpecimens();
    var rec = await recolectorNetwork.getAllRecolectors();
    setState(() {
      speciesList = sps;
      specimens = spc;
      recolectors = rec;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
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
          IconButton(icon: Icon(Icons.refresh), onPressed: _fetchData),
        ],
      ),
      body: _loadPage(currentIndex),
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
    );
  }

  Widget _loadPage(int index) {
    switch (index) {
      case 0:
        return SpecimenPage(list: specimens);
      case 1:
        return SpeciesPage(list: speciesList);
      case 2:
        return RecolectorPage(list: recolectors);
      default:
        return SpeciesPage(list: speciesList);
    }
  }
}
