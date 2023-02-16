import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Widget'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCardType1(),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(
              name: 'Mario bross',
              imageUrl:
                  'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/hc_1440x810/public/media/image/2016/09/mejores-juegos-super-mario.jpg?itok=Y16dIZA5',
            ),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(
              name: 'Megaman',
              imageUrl:
                  'https://sm.ign.com/ign_es/screenshot/default/megaman30-desktop-wallpaper-01_ebps.jpg',
            ),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(
              name: 'Zelda',
              imageUrl:
                  'https://e.rpp-noticias.io/xlarge/2017/02/22/143414_351678.png',
            ),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(
              name: 'Vectorman',
              imageUrl:
                  'https://img.zonared.com/images/analisis/portada/1000/1604-h.jpg',
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
