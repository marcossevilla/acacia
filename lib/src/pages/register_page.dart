import 'package:flutter/material.dart';
import 'package:plants_app/src/models/user.dart';
import 'package:plants_app/src/networking/register_network.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = "register";
  @override
  _RegisterPageState createState() => _RegisterPageState();
  
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final referenceNumberController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    referenceNumberController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  "Regístrate", 
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Introduzca su nombre';
                  }
                },
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nombre"
                ),
                style: TextStyle(
                  fontSize: 16
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Introduzca su apellido';
                    }
                  },
                  controller: lastNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Apellido"
                  ),
                  style: TextStyle(
                    fontSize: 16
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Introduzca su número celular';
                    }
                  },
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Teléfono celular"
                  ),
                  style: TextStyle(
                    fontSize: 16
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Introduzca un número de referencia';
                    }
                  },
                  controller: referenceNumberController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Número de referencia"
                  ),
                  style: TextStyle(
                    fontSize: 16
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Introduzca un nombre de usuario';
                    }
                  },
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre de usuario"
                  ),
                  style: TextStyle(
                    fontSize: 16
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Introduzca un correo electrónico';
                    }
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Correo electróńico"
                  ),
                  style: TextStyle(
                    fontSize: 16
                  )
                ),
              ),
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
                    border: OutlineInputBorder(),
                    labelText: "Contraseña"
                  ),
                  style: TextStyle(
                    fontSize: 16
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 50,
                  child: OutlineButton (
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        RegisterNetwork login = RegisterNetwork();
                        login.postUser(
                          User(
                            profile: null,
                            firstName: nameController.text,
                            lastName: lastNameController.text,
                            username: usernameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            isStaff: false,
                            isSuperuser: false,
                            isActive: true,
                            dateJoined: DateTime.now(),
                            lastLogin: DateTime.now(),
                            groups: [],
                            user_permissions: []
                          )
                        );
                      }
                    },
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor, //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width: 0.8, //width of the border
                    ),
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      "Regístrate",
                      style: TextStyle(fontSize: 16)
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}