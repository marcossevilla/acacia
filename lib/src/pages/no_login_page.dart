import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plants_app/src/pages/login_page.dart';
import 'package:plants_app/src/pages/register_page.dart';

class NoLoginPage extends StatefulWidget {
  @override
  _NoLoginPageState createState() => _NoLoginPageState();
}

class _NoLoginPageState extends State<NoLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Inicia sesión para que puedas registrar y visualizar todas tus fichas técnicas',
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Column(
              children: <Widget>[
                RaisedButton(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Registrarme'),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(RegisterPage.routeName);
                  },
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Iniciar Sesión'),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginPage.routeName);
                  },
                ),
              ],
            ),
            Icon(
              FontAwesomeIcons.piedPiperHat,
              color: Colors.white,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
