import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compontes de Flutter'),
        elevation: 0,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Nombre Ruta'),
          onTap: () {},
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: 50,
      ),
    );
  }
}
