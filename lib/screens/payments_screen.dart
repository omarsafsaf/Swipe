import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments Screen'),
      ),
      body: Center(
        child: Text('Payments Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
