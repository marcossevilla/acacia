import 'package:flutter/material.dart';
import 'package:plants_app/src/models/genus.dart';
import 'package:plants_app/src/models/plant_specimen.dart';
import 'package:plants_app/src/networking/specimen_props.dart';
import 'package:plants_app/src/utils/validators.dart';

import '../models/status.dart';
import '../models/plant_family.dart';
import '../models/plant_species.dart';
import '../networking/family_network.dart';
import '../networking/species_network.dart';
import '../networking/specimen_network.dart';

class AddSpecimen extends StatefulWidget {
  static const String routeName = 'addSpecimen';

  @override
  State<StatefulWidget> createState() {
    return _AddSpecimenState();
  }
}

class _AddSpecimenState extends State<AddSpecimen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FamilyNetwork _familyNetwork = FamilyNetwork();
  SpeciesNetwork _speciesNetwork = SpeciesNetwork();
  SpecimenNetwork _specimenNetwork = SpecimenNetwork();
  SpecimenPropsNetwork _propsNetwork = SpecimenPropsNetwork();

  PlantSpecimen _plantSpecimen = PlantSpecimen();

  Status _status = Status();

  List<Biostatus> _biostatus = List();
  Biostatus _currentBiostatus;

  List<Genus> _genuses = List();
  Genus _currentGenus;

  List<Family> _families = List();
  Family _currentFamily;

  List<Species> _speciesList = List();
  Species _currentSpecies;

  List<Biostatus> _ecosystems = List();
  Biostatus _currentEcosystem;

  List<Biostatus> _recollectionArea = List();
  Biostatus _currentRecollectionArea;

  /*
    "ecosystem"
    "recolection_area_status"
    "country"
    "state"
    "city
   */

  _fetchData() async {
    var fams = await _familyNetwork.getAllFamilies();
    var species = await _speciesNetwork.getAllSpecies();
    var biostatus = await _propsNetwork.getBiostatuses();
    var genuses = await _propsNetwork.getGenuses();
    setState(() {
      _families = fams;
      _speciesList = species;
      _biostatus = biostatus;
      _genuses = genuses;
      _currentFamily = _families[0];
      _currentSpecies = _speciesList[0];
      _currentBiostatus = _biostatus[0];
      _currentGenus = genuses[0];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void setState(fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar nuevo especimen')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: 'Nombre común'),
                onSaved: (value) => setState(
                  () => _plantSpecimen.species.commonName = value,
                ),
                validator: (value) =>
                    value.isEmpty ? 'No has llenado el campo!' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descripción'),
                onSaved: (value) => setState(
                  () => _plantSpecimen.description = value,
                ),
                validator: (value) =>
                    value.isEmpty ? 'No has llenado el campo!' : null,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Cantidad ejemplares colectados'),
                onSaved: (value) => setState(
                  () => _plantSpecimen.numberOfSamples = int.parse(value),
                ),
                validator: (value) => value.isEmpty && isNumeric(value) == false
                    ? 'No has llenado el campo o no ingresaste un número'
                    : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ubicación'),
                onSaved: (value) => setState(
                  () => _plantSpecimen.location = value,
                ),
                validator: (value) =>
                    value.isEmpty ? 'No has llenado el campo!' : null,
              ),
              SizedBox(height: 30.0),
              _families.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Bioestado'),
                        Spacer(),
                        DropdownButton<Biostatus>(
                          value: _currentBiostatus,
                          items: _biostatus
                              .map(
                                (f) => DropdownMenuItem<Biostatus>(
                                  value: f,
                                  child: Text(f.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _currentBiostatus = value),
                        ),
                      ],
                    ),
              SizedBox(height: 20.0),
              _speciesList.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Especie'),
                        Spacer(),
                        DropdownButton<Species>(
                          value: _currentSpecies,
                          items: _speciesList
                              .map(
                                (s) => DropdownMenuItem<Species>(
                                  value: s,
                                  child: Text(s.commonName),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _currentSpecies = value),
                        ),
                      ],
                    ),
              SizedBox(height: 20.0),
              _genuses.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Género'),
                        Spacer(),
                        DropdownButton<Genus>(
                          value: _currentGenus,
                          items: _genuses
                              .map(
                                (g) => DropdownMenuItem<Genus>(
                                  value: g,
                                  child: Text(g.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _currentGenus = value),
                        ),
                      ],
                    ),
              SizedBox(height: 20.0),
              _families.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Familia'),
                        Spacer(),
                        DropdownButton<Family>(
                          value: _currentFamily,
                          items: _families
                              .map(
                                (f) => DropdownMenuItem<Family>(
                                  value: f,
                                  child: Text(f.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _currentFamily = value),
                        ),
                      ],
                    ),
              SizedBox(height: 30.0),
              FlatButton(
                child: Text('Registrar', style: TextStyle(color: Colors.white)),
                onPressed: _postNewSpecimen,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  _postNewSpecimen() async {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();

    var now = DateTime.now();

    // TODO: cambiar a nueva info para hacer post de especimen

    // PlantSpecimen _specimen = PlantSpecimen(
    //   '',
    //   '${now.year}-${now.month}-${now.day}',
    //   _status,
    //   _currentSpecies,
    //   _currentFamily,
    // );

    // await _specimenNetwork.postSpecimen(_specimen);

    Navigator.pop(context);
  }
}
