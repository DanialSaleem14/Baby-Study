import 'package:flutter/material.dart';

class level4page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 4'),
      ),
      body: Center(
        child: Text(
          'Welcome to Level 4!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
