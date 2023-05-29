import 'package:flutter/material.dart';

class BusinessScreen extends StatelessWidget {
  static const String routName = 'business screen';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Business'),
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
            'business',
        ),
      ),
    );
  }
}
