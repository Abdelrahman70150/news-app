import 'package:flutter/material.dart';

class SportsScreen extends StatelessWidget {
static const String routName = 'sports screen';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Sports'),
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
      body: const Center(
        child: Text(
          'sports'
        ),
      ),
    );
  }
}
