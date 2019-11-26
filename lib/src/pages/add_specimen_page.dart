import 'package:flutter/material.dart';

import '../networking/family_network.dart';
import '../networking/species_network.dart';
import '../networking/specimen_network.dart';

import '../models/status.dart';
import '../models/recolector.dart';
import '../models/plant_family.dart';
import '../models/plant_species.dart';
import '../models/plant_specimen.dart';

class AddSpecimen extends StatefulWidget {
  @override
  _AddSpecimenState createState() => _AddSpecimenState();
}

class _AddSpecimenState extends State<AddSpecimen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FamilyNetwork _familyNetwork = FamilyNetwork();
  SpeciesNetwork _speciesNetwork = SpeciesNetwork();
  SpecimenNetwork _specimenNetwork = SpecimenNetwork();

  Recolector _recolector = Recolector();
  Status _status = Status();

  // plant family dropdowns
  List<PlantFamily> _families = List();
  PlantFamily _currentFamily;

  // plant species dropdowns
  List<PlantSpecies> _speciesList = List();
  PlantSpecies _currentSpecies;

  _fetchData() async {
    var fams = await _familyNetwork.getAllFamilies();
    var species = await _speciesNetwork.getAllSpecies();
    setState(() {
      _families = fams;
      _speciesList = species;
      // _currentFamily = _families[0];
      // _currentSpecies = _speciesList[0];
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text(
                'Registrar nuevo especimen',
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.title.copyWith(fontSize: 25.0),
              ),
            ),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: 'Nombre del recolector'),
              onSaved: (value) => setState(() => _recolector.name = value),
              validator: (value) =>
                  value.isEmpty ? 'No has llenado el campo!' : null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Estado'),
              onSaved: (value) => setState(() => _status.name = value),
              validator: (value) =>
                  value.isEmpty ? 'No has llenado el campo!' : null,
            ),
            SizedBox(height: 30.0),
            _speciesList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Especie'),
                      Spacer(),
                      DropdownButton<PlantSpecies>(
                        value: _currentSpecies,
                        items: _speciesList
                            .map(
                              (s) => DropdownMenuItem<PlantSpecies>(
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
            _families.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Familia'),
                      Spacer(),
                      DropdownButton<PlantFamily>(
                        value: _currentFamily,
                        items: _families
                            .map(
                              (f) => DropdownMenuItem<PlantFamily>(
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
    );
  }

  _postNewSpecimen() async {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();

    var now = DateTime.now();

    PlantSpecimen _specimen = PlantSpecimen(
      _recolector,
      '',
      '${now.year}-${now.month}-${now.day}',
      _status,
      _currentSpecies,
      _currentFamily,
    );

    await _specimenNetwork.postSpecimen(_specimen);

    Navigator.pop(context);

    // Scaffold.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('Guardado!'),
    //   ),
    // );
  }
}
