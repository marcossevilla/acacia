import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/genus.dart';
import '../models/status.dart';
import '../models/plant_family.dart';
import '../models/plant_species.dart';
import '../models/plant_specimen.dart';

import '../networking/specimen_props.dart';
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

  List<Status> _status = List();
  Status _currentStatus;

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

  List<Biostatus> _countries = List();
  Biostatus _currentCountry;

  List<City> _cities = List();
  City _currentCity;

  List<CountryState> _states = List();
  CountryState _currentState;

  _fetchData() async {
    var fams = await _familyNetwork.getAllFamilies();
    var species = await _speciesNetwork.getAllSpecies();
    var biostatus = await _propsNetwork.getBiostatuses();
    var genuses = await _propsNetwork.getGenuses();
    var ecosystems = await _propsNetwork.getEcosystems();
    var recs = await _propsNetwork.getRecollections();
    var countries = await _propsNetwork.getCountries();
    var cities = await _propsNetwork.getCities();
    var states = await _propsNetwork.getStates();
    var status = await _propsNetwork.getStatus();

    setState(() {
      _families = fams;
      _speciesList = species;
      _biostatus = biostatus;
      _genuses = genuses;
      _ecosystems = ecosystems;
      _recollectionArea = recs;
      _countries = countries;
      _cities = cities;
      _states = states;
      _status = status;

      _currentFamily = _families[0];
      _currentSpecies = _speciesList[0];
      _currentBiostatus = _biostatus[0];
      _currentGenus = genuses[0];
      _currentEcosystem = _ecosystems[0];
      _currentRecollectionArea = _recollectionArea[0];
      _currentCountry = _countries[0];
      _currentCity = _cities[0];
      _currentState = _states[0];
      _currentStatus = _status[0];
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
                validator: (value) =>
                    value.isEmpty == false ? 'No has llenado el campo!' : null,
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
              SizedBox(height: 20.0),
              _status.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Estado'),
                        Spacer(),
                        DropdownButton<Status>(
                          value: _currentStatus,
                          items: _status
                              .map(
                                (s) => DropdownMenuItem<Status>(
                                  value: s,
                                  child: Text(s.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _currentStatus = value),
                        ),
                      ],
                    ),
              SizedBox(height: 20.0),
              _ecosystems.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Ecosistema'),
                        Spacer(),
                        DropdownButton<Biostatus>(
                          value: _currentEcosystem,
                          items: _ecosystems
                              .map(
                                (e) => DropdownMenuItem<Biostatus>(
                                  value: e,
                                  child: Text(e.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _currentEcosystem = value),
                        ),
                      ],
                    ),
              SizedBox(height: 20.0),
              _recollectionArea.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Área de recolección'),
                        Spacer(),
                        DropdownButton<Biostatus>(
                          value: _currentRecollectionArea,
                          items: _recollectionArea
                              .map(
                                (s) => DropdownMenuItem<Biostatus>(
                                  value: s,
                                  child: Text(s.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _currentRecollectionArea = value),
                        ),
                      ],
                    ),
              SizedBox(height: 20.0),
              _countries.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('País'),
                        Spacer(),
                        DropdownButton<Biostatus>(
                          value: _currentCountry,
                          items: _countries
                              .map(
                                (s) => DropdownMenuItem<Biostatus>(
                                  value: s,
                                  child: Text(s.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _currentCountry = value),
                        ),
                      ],
                    ),
              SizedBox(height: 20.0),
              _states.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Estado/Provincia'),
                        Spacer(),
                        DropdownButton<CountryState>(
                          value: _currentState,
                          items: _states
                              .map(
                                (s) => DropdownMenuItem<CountryState>(
                                  value: s,
                                  child: Text(s.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _currentState = value),
                        ),
                      ],
                    ),
              SizedBox(height: 20.0),
              _cities.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Ciudad'),
                        Spacer(),
                        DropdownButton<City>(
                          value: _currentCity,
                          items: _cities
                              .map(
                                (s) => DropdownMenuItem<City>(
                                  value: s,
                                  child: Text(s.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _currentCity = value),
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

    PlantSpecimen _specimen = PlantSpecimen(
      biostatus: _currentBiostatus,
      photo: null,
      dateReceived: DateTime.now(),
      numberOfSamples: _plantSpecimen.numberOfSamples,
      description: _plantSpecimen.description,
      latitude: null,
      longitude: null,
      location: _plantSpecimen.location,
      complete: true,
      user: User(id: 1),
      family: _currentFamily,
      genus: _currentGenus,
      species: _currentSpecies,
      status: _currentStatus,
      ecosystem: _currentEcosystem,
      recollectionAreaStatus: _currentRecollectionArea,
      country: _currentCountry,
      state: _currentState,
      city: _currentCity,
    );

    print(_specimen.toString());

    // bool itWorked = await _specimenNetwork.postSpecimen(_specimen);

    // print(itWorked);

    Navigator.pop(context);
  }
}
