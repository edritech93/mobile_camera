import 'package:flutter/material.dart';
import 'package:mobile_camera/screens/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: Drawer(
          child: Center(
            child: Container(
                child: ElevatedButton(
                    onPressed: (() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                          (route) => false);
                    }),
                    child: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 21),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    )),
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16)),
          ),
        ),
        body: const Center(
          child: Text('This is Home Screen', style: TextStyle(fontSize: 32)),
        ));
  }
}
