import 'package:flutter/material.dart';
import 'package:plants_app/src/networking/species_network.dart';
import 'package:plants_app/src/widgets/species_card.dart';

import '../utils/acacia.dart';
import '../models/plant_species.dart';

/* 
 *  Bienvenidos a su primer StatefulWidget :D
 *  
 *  Estos se separan en dos partes: 
 *  - Widget/Clase
 *  - State/Estado
 * 
 *  En la clase se declara todo lo que sea
 *  atributo/propiedad estático de este widget, 
 *  por ejemplo el routeName
 * 
 *  En el estado van las propiedades cambiantes
 *  o dinámicas del widget
*/
class HomePage extends StatefulWidget {
  /*
    * Al hacer una app basada en rutas,
    * se debe establecer en una variable
    * el nombre de cada ruta como una 
    * constante y ya que es parte de una 
    * clase, es estática
  */
  static const String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* 
    las variables de estado se colocan 
    fuera de los métodos
  */

  int currentIndex = 0; // para controlar en qué pestaña está
  bool isLoading = true;
  List<PlantSpecies> speciesList;
  SpeciesNetwork speciesNetwork = SpeciesNetwork();

  _fetchSpecies() async {
    setState(() => isLoading = true);
    var res = await speciesNetwork.getAllSpecies();
    setState(() => speciesList = res);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    _fetchSpecies();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          appName,
          style: Theme.of(context).textTheme.display1,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _fetchSpecies(),
          ),
        ],
      ),
      // * bienvenidos a su primer widget customizado :D
      body: !isLoading
          ? ListView.builder(
              itemCount: speciesList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SpeciesCard(plant: speciesList[index]),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColorLight,
              ),
            ),
      bottomNavigationBar: BigBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BigBottomNavBar extends StatelessWidget {
  const BigBottomNavBar({
    Key key,
    @required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        // se cambia/actualiza el index actual
        onTap: onTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
