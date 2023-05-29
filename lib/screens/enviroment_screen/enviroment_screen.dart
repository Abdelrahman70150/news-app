import 'package:flutter/material.dart';

class EnviromentScreen extends StatelessWidget {
  static const String routName = 'enviroment screen';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Enviroment'),
        leading: const Icon(
          Icons.menu,
          size: 34,
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.search,
              size: 34,

            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
            'enviroment'
        ),
      ),
    );
  }
}
