import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  onPressed: () {},
                ),
                RaisedButton(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Iniciar Sesión'),
                  ),
                  onPressed: () {},
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
