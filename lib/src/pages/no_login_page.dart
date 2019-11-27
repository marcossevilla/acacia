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
      color: Colors.white,
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
                  .copyWith(color: Colors.green),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: 50,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Registrarme', style: TextStyle(fontSize: 16, color: Colors.white),),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(RegisterPage.routeName);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: OutlineButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginPage.routeName);
                      },
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, //Color of the border
                          style: BorderStyle.solid, //Style of the border
                          width: 0.8, //width of the border
                        ),
                        textColor: Theme.of(context).primaryColor,
                        child: Text(
                          "Iniciar sesión",
                          style: TextStyle(fontSize: 16)
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
