import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
                child: const Text('SM'), backgroundColor: Colors.indigo[900]),
          )
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 120,
          backgroundImage: NetworkImage(
              'https://media.gq-magazine.co.uk/photos/63468efef4f48bee2acb7062/3:2/w_1620,h_1080,c_limit/Tom-Holland-Spiderman-what-we-know-so-far.jpg'),
        ),
      ),
    );
  }
}
