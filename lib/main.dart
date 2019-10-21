import 'package:flutter/material.dart';

import 'src/utils/acacia.dart';
import 'src/utils/theme.dart';
import 'src/utils/routes.dart';

void main() => runApp(Acacia());

class Acacia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: theme,
      initialRoute: initialRoute,
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
