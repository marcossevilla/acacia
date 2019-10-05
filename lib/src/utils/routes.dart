import 'package:flutter/material.dart';

import '../pages/home_page.dart';

// * initialRoute == primera pantalla que se verá
const String initialRoute = HomePage.routeName;

/*
 * Acá se crea un mapa que contiene el constructor
 * de rutas para la app
 * 
 * El key es la propiedad routeName de cada página
 * y el value es un método WidgetBuilder que toma
 * como argumento un BuildContext para retornar
 * un widget de la página a la que pertenezca esa
 * ruta
 * 
 * Si crean una nueva página, agréguenla como ruta
 * usando esa misma sintaxis:
 * 
 * <Página>.routeName: (BuildContext context) => <Página>(),
 * 
 * Las comas formatean, no las olviden :) 
*/

Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (BuildContext context) => HomePage(),
};
