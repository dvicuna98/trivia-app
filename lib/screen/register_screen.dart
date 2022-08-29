import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name':'',
      'last_name':'',
      'username':'',
      'email':'',
      'password':'',
      'role':'basic'

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
                  formProperty: 'last_name',formValues: formValues),
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
                  onPressed: (){

                    FocusScope.of(context).requestFocus(FocusNode());

                    if(!formKey.currentState!.validate()){
                      print('invalid');
                      return;
                    }

                    print(formValues);
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

