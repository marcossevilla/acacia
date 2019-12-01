import 'package:flutter/material.dart';
import 'package:plants_app/src/models/nested_specimen.dart';
import 'package:plants_app/src/shared/preferences.dart';

import '../models/genus.dart';
import '../models/status.dart';
import '../models/plant_family.dart';
import '../models/plant_species.dart';
import '../models/plant_specimen.dart';

import '../networking/family_network.dart';
import '../networking/species_network.dart';
import '../networking/specimen_network.dart';

final prefs = UserPreferences();

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

  PlantSpecimen _plantSpecimen = PlantSpecimen();

  Status _currentStatus;
  Biostatus _currentBiostatus;
  Genus _currentGenus;
  Family _currentFamily;
  Species _currentSpecies;
  Biostatus _currentEcosystem;
  Biostatus _currentRecollectionArea;
  Biostatus _currentCountry;
  City _currentCity;
  CountryState _currentState;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
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
                      value.isEmpty ? 'No has llenado el campo!' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Ubicación'),
                  onSaved: (value) => setState(
                    () => _plantSpecimen.location = value,
                  ),
                  validator: (value) =>
                      value.isEmpty ? 'No has llenado el campo!' : null,
                ),
                SizedBox(height: 20.0),
                FutureBuilder(
                  future: _familyNetwork.getAllFamilies(),
                  builder: (context, AsyncSnapshot<List<Family>> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Familia'),
                          Spacer(),
                          DropdownButton<Family>(
                            // value: _currentFamily,
                            items: snapshot.data
                                .map(
                                  (f) => DropdownMenuItem<Family>(
                                    value: f,
                                    child: Text(f.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => setState(
                              () => _currentFamily = value,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                FutureBuilder(
                  future: _speciesNetwork.getAllSpecies(),
                  builder: (context, AsyncSnapshot<List<Species>> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Especie'),
                          Spacer(),
                          DropdownButton<Species>(
                            // value: _currentSpecies,
                            items: snapshot.data
                                .map(
                                  (f) => DropdownMenuItem<Species>(
                                    value: f,
                                    child: Text(f.commonName),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => setState(
                              () => _currentSpecies = value,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder(
                  future: _specimenNetwork.getBiostatuses(),
                  builder: (context, AsyncSnapshot<List<Biostatus>> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Bioestado'),
                          Spacer(),
                          DropdownButton<Biostatus>(
                            // value: _currentBiostatus,
                            items: snapshot.data
                                .map(
                                  (f) => DropdownMenuItem<Biostatus>(
                                    value: f,
                                    child: Text(f.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => setState(
                              () => _currentBiostatus = value,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder(
                  future: _specimenNetwork.getGenuses(),
                  builder: (context, AsyncSnapshot<List<Genus>> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Género'),
                          Spacer(),
                          DropdownButton<Genus>(
                            // value: _currentGenus,
                            items: snapshot.data
                                .map(
                                  (f) => DropdownMenuItem<Genus>(
                                    value: f,
                                    child: Text(f.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => setState(
                              () => _currentGenus = value,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder(
                  future: _specimenNetwork.getStatus(),
                  builder: (context, AsyncSnapshot<List<Status>> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Estado'),
                          Spacer(),
                          DropdownButton<Status>(
                            // value: _currentStatus,
                            items: snapshot.data
                                .map(
                                  (f) => DropdownMenuItem<Status>(
                                    value: f,
                                    child: Text(f.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => setState(
                              () => _currentStatus = value,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder(
                  future: _specimenNetwork.getEcosystems(),
                  builder: (context, AsyncSnapshot<List<Biostatus>> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Ecosistema'),
                          Spacer(),
                          DropdownButton<Biostatus>(
                            // value: _currentEcosystem,
                            items: snapshot.data
                                .map(
                                  (f) => DropdownMenuItem<Biostatus>(
                                    value: f,
                                    child: Text(f.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => setState(
                              () => _currentEcosystem = value,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder(
                  future: _specimenNetwork.getRecollections(),
                  builder: (context, AsyncSnapshot<List<Biostatus>> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Área de recolección'),
                          Spacer(),
                          DropdownButton<Biostatus>(
                            // value: _currentRecollectionArea,
                            items: snapshot.data
                                .map(
                                  (f) => DropdownMenuItem<Biostatus>(
                                    value: f,
                                    child: Text(f.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => setState(
                              () => _currentRecollectionArea = value,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder(
                  future: _specimenNetwork.getCountries(),
                  builder: (context, AsyncSnapshot<List<Biostatus>> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('País'),
                          Spacer(),
                          DropdownButton<Biostatus>(
                            // value: _currentCountry,
                            items: snapshot.data
                                .map(
                                  (f) => DropdownMenuItem<Biostatus>(
                                    value: f,
                                    child: Text(f.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => setState(
                              () => _currentCountry = value,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder(
                  future: _specimenNetwork.getStates(),
                  builder:
                      (context, AsyncSnapshot<List<CountryState>> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Estado'),
                          Spacer(),
                          DropdownButton<CountryState>(
                            // value: _currentState,
                            items: snapshot.data
                                .map(
                                  (f) => DropdownMenuItem<CountryState>(
                                    value: f,
                                    child: Text(f.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => setState(
                              () => _currentState = value,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder(
                  future: _specimenNetwork.getCities(),
                  builder: (context, AsyncSnapshot<List<City>> snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Ciudad'),
                          Spacer(),
                          DropdownButton<City>(
                            // value: _currentCity,
                            items: snapshot.data
                                .map(
                                  (f) => DropdownMenuItem<City>(
                                    value: f,
                                    child: Text(f.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) => setState(
                              () => _currentCity = value,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(height: 30.0),
                FlatButton(
                  child:
                      Text('Registrar', style: TextStyle(color: Colors.white)),
                  onPressed: _postNewSpecimen,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _postNewSpecimen() async {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();

    NestedSpecimen _specimen = NestedSpecimen(
      biostatus: _currentBiostatus.id,
      photo: null,
      dateReceived: DateTime.now(),
      numberOfSamples: _plantSpecimen.numberOfSamples,
      description: _plantSpecimen.description,
      latitude: null,
      longitude: null,
      location: _plantSpecimen.location,
      complete: true,
      user: 1,
      family: _currentFamily.id,
      genus: _currentGenus.id,
      species: _currentSpecies.id,
      status: _currentStatus.id,
      ecosystem: _currentEcosystem.id,
      recolectionAreaStatus: _currentRecollectionArea.id,
      country: _currentCountry.id,
      state: _currentState.id,
      city: _currentCity.id,
    );

    await _specimenNetwork.postSpecimen(_specimen);

    Navigator.pop(context);
  }
}
