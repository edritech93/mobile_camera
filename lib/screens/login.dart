import 'package:flutter/material.dart';
import 'package:mobile_camera/components/Loader.dart';
import 'package:mobile_camera/services/storage.dart';

import '../components/AlertApps.dart';
import '../services/api.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controllerUsername.dispose();
    super.dispose();
  }

  void _onChangeUsername(String value) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        username = value;
      });
    }
  }

  void _onChangePassword(String value) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        password = value;
      });
    }
  }

  void _onPressLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showLoader(context);
      Api().login().then((value) {
        Storage().setToken('123qwe');
        _onPressHome();
      }).catchError((error) {
        Navigator.pop(context);
        showAlert(context, error.toString(), null);
      });
    }
  }

  void _onPressHome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: const Image(
                        image: AssetImage('assets/images/icon_haermes.png')),
                    margin: const EdgeInsets.fromLTRB(0, 150, 0, 54),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: TextFormField(
                                controller: _controllerUsername,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Username',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Username is required';
                                  }
                                  return null;
                                },
                                onChanged: (String value) =>
                                    {_onChangeUsername(value)}),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            child: TextFormField(
                                controller: _controllerPassword,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  }
                                  return null;
                                },
                                onChanged: (String value) =>
                                    {_onChangePassword(value)}),
                          ),
                          Container(
                            child: ElevatedButton(
                                onPressed: (() {
                                  _onPressLogin(context);
                                }),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 21),
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                )),
                            margin: const EdgeInsets.only(bottom: 16),
                          ),
                          // NOTE: for testing only
                          TextButton(
                              onPressed: () => _onPressHome(),
                              child: const Text('Goto Home')),
                        ],
                      )),
                ],
              ),
            )));
  }
}
