import 'package:flutter/material.dart';
import 'package:fl_components/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100; //variable para el movimiento del slider
  bool _sliderEnabled = true; //variable para el check

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider and Check'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
              min: 50,
              max: 400,
              activeColor: AppTheme.primary,
              value: _sliderValue,
              //divisions: 5,
              onChanged:
                  _sliderEnabled //si el onChanged es igual al _sliderEnabled habilitado entonces(?) es igual al value, caso contrario (:) es null.
                      ? (value) {
                          _sliderValue = value;
                          setState(() {});
                        }
                      : null),
/*
          //CheckBox
          Checkbox(
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value ?? true; //??por defecto
              setState(() {});
            },
          ),

          //CheckboxListTile
          CheckboxListTile(
            value: _sliderEnabled,
            onChanged: ((value) => setState(() {
                  _sliderEnabled = value ?? true;
                })),
            title: Text('Habilitar Slider'),
            activeColor: AppTheme.primary,
          ),

          //Switch
          Switch(
            value: _sliderEnabled,
            onChanged: ((value) => setState(() {
                  _sliderEnabled = value;
                })),
            activeColor: AppTheme.primary,
          ),
*/
          //SwitchListTile (Este es el más usado)
          SwitchListTile.adaptive(
            value: _sliderEnabled,
            onChanged: ((value) => setState(() {
                  _sliderEnabled = value;
                })),
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primary,
          ),

          const AboutListTile(), //detalles sobre licencias de los widgets utilizados en la app!

          Expanded(
            //!El SingleChildScrollView y el Expanded sirven para que se pueda hacer scroll en la panalla cuando la imagen se sale de cuadro por el tamaño!
            //!El SingleChildScrollView suele envolver al Column y el Expanded suele envolver al SingleChildScrollView!!!
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage(
                    'https://static.wikia.nocookie.net/dc-fanon/images/a/a1/Linterna_Verde_Zack_Jordan_1.png/revision/latest?cb=20160218023716&path-prefix=es'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
