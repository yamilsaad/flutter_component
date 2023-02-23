import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  final String formPropetry;
  final Map<String, String> formValues;

  const CustomInputField({
    super.key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    required this.formPropetry,
    required this.formValues,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: obscureText,
      //el onChanged nos permite capturar los valores de lo que se va escribiendo
      onChanged: (value) => formValues[formPropetry] =
          value, //nos va a permitir conectar nuestro formulario con el map
      validator: (value) {
        if (value == null) return 'Este campo es requerido';
        return value.length < 3
            ? 'Mínimo de 3 letras'
            : null; //orienta al usuario a que debe ingresar una palabra que supere 3 caracteres!
      },
      autovalidateMode: AutovalidateMode
          .onUserInteraction, //este atributo hace que el return anterior solo aparezca cuando el usario interactua con el field.
      decoration: InputDecoration(
        hintText: hintText, //el sello de agua en la sentencia
        labelText: labelText, //etiqueta!!!
        helperText: helperText, //otra etiqueta debajo!
        //counterText:'3 caracteres', //ora etiqueta que aparece al final de la sentencia!
        suffixIcon: suffixIcon == null
            ? null
            : Icon(suffixIcon), //un icono al final de la sentencia!
        //prefixIcon: Icon(Icons.security),//un icono al principio de la sentencia!
        icon: icon == null
            ? null
            : Icon(icon), //un icono al lado del TextFormnField!
      ),
    );
  }
}
