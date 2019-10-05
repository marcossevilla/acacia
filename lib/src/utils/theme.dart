/*

  * Aquí va todo lo relacionado al tema/estilo del app

  - Colores a usar
  - Fuente a usar

*/

import 'package:flutter/material.dart';

/* 
  * ThemeData es la clase donde está contenida
  * toda la info del tema 
*/

ThemeData theme = ThemeData(
  /*
   *  primarySwatch crea toda la paleta de colores
   *  en base al color que se le asigne.
   * 
   *  En este caso vamos a tener una paleta usando
   *  el color verde en distintas tonalidades  
   */
  primarySwatch: Colors.green,
  textTheme: textTheme,
);

TextTheme textTheme = TextTheme(
  display1: TextStyle(color: Colors.white),
);
