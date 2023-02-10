import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album_outlined, color: AppTheme.primary),
            title: Text('Soyun titulo'),
            subtitle: Text(
                'Consectetur veniam do aliquip eiusmod nostrud sit minim eiusmod. Id esse nisi enim nostrud. Nostrud laboris dolor minim mollit qui enim dolor excepteur aute aliqua.'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: Text('Cancel')),
                TextButton(onPressed: () {}, child: Text('Ok'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
