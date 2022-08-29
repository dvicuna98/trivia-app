import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'email':'',
      'password':'',
      'role':'basic'
    };

    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                height: 300,
                margin: const EdgeInsets.all(25),
                child: const Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
              CustomInputField(labelText: 'Correo',hintText: 'Correo Usuario',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',formValues: formValues),
              const SizedBox(height: 10,),
              CustomInputField(labelText: 'Contraseña',hintText: 'Contraseña',
                  obscureText: true, formProperty: 'password',formValues: formValues),

              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    child: const Text('No tienes cuenta registrate'),
                  onPressed: (){
                      Navigator.of(context).pushNamed('Register');
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: (){

                    FocusScope.of(context).requestFocus(FocusNode());

                    if(!formKey.currentState!.validate()){
                      print('invalid');
                      return;
                    }

                    Navigator.of(context).pushReplacementNamed('HomePage');
                    print(formValues);
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Center(child: Text('Iniciar Session',
                      style: TextStyle(
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

