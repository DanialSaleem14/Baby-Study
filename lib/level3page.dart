import 'package:flutter/material.dart';

class level3page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 3'),
      ),
      body: Center(
        child: Text(
          'Welcome to Level 3!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
