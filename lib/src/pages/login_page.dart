import 'package:flutter/material.dart';
import 'package:plants_app/src/models/credentials.dart';
import 'package:plants_app/src/networking/credentials_network.dart';
import 'package:plants_app/src/shared/preferences.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text("Iniciar sesión",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
              ),
              TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Introduzca un nombre de usuario';
                    }
                  },
                  controller: usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nombre de usuario"),
                  style: TextStyle(fontSize: 16)),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Introduzca una contraseña';
                      }
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Contraseña"),
                    style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                    height: 50,
                    child: OutlineButton(
                      onPressed: () async {
                        UserPreferences preferences = UserPreferences();

                        if (_formKey.currentState.validate()) {
                          CredentialsNetwork login = CredentialsNetwork();

                          await login.postLogin(Credentials(
                            username: usernameController.text.toString(),
                            password: passwordController.text.toString(),
                          ));

                          if (preferences.token != "no-token") {
                            Toast.show(
                              "Inicio de sesión exitoso.",
                              context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM,
                            );
                          } else {
                            Toast.show(
                              "No autorizado.",
                              context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM,
                            );
                          }
                        }
                      },
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        style: BorderStyle.solid,
                        width: 0.8,
                      ),
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        "Iniciar sesión",
                        style: TextStyle(fontSize: 16),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
