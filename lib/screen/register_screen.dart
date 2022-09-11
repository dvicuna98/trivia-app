import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upstrivia/providers/trivia_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TriviaProvider>(context);

    final formKey = GlobalKey<FormState>();
    bool loading = false;

    final Map<String, String> formValues = {
      'first_name':'',
      'surname':'',
      "country": "United States",
      'username':'',
      'email':'',
      'password':'',

    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrate'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomInputField(labelText: 'Nombre',hintText: 'Nombre Usuario',
                formProperty: 'first_name',formValues: formValues,),
              const SizedBox(height: 10,),
              CustomInputField(labelText: 'Apellido',hintText: 'Apellido Usuario',
                  formProperty: 'surname',formValues: formValues),
              const SizedBox(height: 10,),
              CustomInputField(labelText: 'Username',hintText: 'Sobrenombre',
                  formProperty: 'username',formValues: formValues),
              const SizedBox(height: 10,),
              CustomInputField(labelText: 'Correo',hintText: 'Correo Usuario',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',formValues: formValues),
              const SizedBox(height: 10,),
              CustomInputField(labelText: 'Contraseña',hintText: 'Contraseña',
                  obscureText: true, formProperty: 'password',formValues: formValues),

              const SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: loading? null: () async {

                    loading = true;
                    FocusScope.of(context).requestFocus(FocusNode());

                    if(!formKey.currentState!.validate()){
                      print('invalid');
                      return;
                    }


                    var statusCode = await provider.createNewUser(json.encode(formValues));
                    if(statusCode == 201){
                      final snackBar = SnackBar(
                        content: const Text('Usuario creado'),
                        action: SnackBarAction(
                          label: 'cerrar',
                          onPressed: () {
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.of(context).pushReplacementNamed('Login');
                    }

                    loading = false;

                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Center(child: Text('Guardar',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    )),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

