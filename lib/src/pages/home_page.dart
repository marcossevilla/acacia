import 'package:flutter/material.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _loadPage(int index) {
    switch (index) {
      case 0:
        return SpeciesPage(list: speciesList);
      case 1:
        return RecolectorPage();
      default:
        return SpeciesPage(list: speciesList);
    }
  }
}
