import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //vamos a usar una key para mantener la referencia del formulario
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    //Acá voy a guardar la informacion de mi formulario
    final Map<String, String> formValues = {
      'first_name': 'Yamil',
      'last_name': 'Fernandez',
      'email': 'yamil@google.com',
      'password': '123456',
      'role': 'Admin'
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs y Forms'),
      ),
      //el SingleChildScrollView es parecido al listview, nos permite hacer scroll pero respetando el teclado numerico sin importar el tamaño de los objetos que haya que scrollear!
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key:
                myFormKey, //variabe de referencia del formulario key: myFormKey
            child: Column(
              children: [
                SizedBox(height: 20),
                CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Nombre del usuario',
                  formPropetry: 'first_name',
                  formValues: formValues,
                ),
                SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Apellido',
                  hintText: 'Apellido del usuario',
                  formPropetry: 'last_name',
                  formValues: formValues,
                ),
                SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Email',
                  hintText: 'Email de usuario',
                  keyboardType: TextInputType.emailAddress,
                  formPropetry: 'email',
                  formValues: formValues,
                ),
                SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Password',
                  hintText: 'Password',
                  obscureText: true,
                  formPropetry: 'password',
                  formValues: formValues,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Guardar'))),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(
                        FocusNode()); //!Esta linea esconde el teclado!!!!

                    //Imprimir valores de formularios
                    if (!myFormKey.currentState!.validate()) {
                      print('Formulario no valido');
                      return;
                    }
                    print(formValues);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
