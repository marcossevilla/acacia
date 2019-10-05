import 'package:flutter/material.dart';

import 'src/utils/acacia.dart';
import 'src/utils/theme.dart';
import 'src/utils/routes.dart';

/* 
  * Creo que todos sabemos qué es un main ¯\_(ツ)_/¯

  * runApp es un método que como tal ejecuta el
  * widget que se le mande, en este caso, 
  * un MaterialApp
*/
void main() => runApp(Acacia());

class Acacia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* 
      MaterialApp es el widget padre que 
      contiene todos los demás widgets,
      tiene el estilo de Android(Material)

      Si se quisiera usar el estilo de iOS
      tendría que usarse una CupertinoApp
    */

    return MaterialApp(
      title: appName,
      theme: theme,
      initialRoute: initialRoute,
      routes: routes,
      // esto quita la cinta que dice debug
      debugShowCheckedModeBanner: false,
    );
  }
}
