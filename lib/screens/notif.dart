import 'package:flutter/material.dart';

class Notif extends StatelessWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
        ),
        body: const Center(
          child: Text('This is Notification Screen',
              style: TextStyle(fontSize: 32)),
        ));
  }
}
