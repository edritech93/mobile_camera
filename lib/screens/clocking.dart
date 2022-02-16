import 'package:flutter/material.dart';

class Clocking extends StatefulWidget {
  const Clocking({Key? key}) : super(key: key);

  @override
  State<Clocking> createState() => _ClockingState();
}

class _ClockingState extends State<Clocking> {
  void _onPressClocking() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clocking'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6, // 60% of space => (6/(6 + 4))
            child: Container(
              color: Colors.white,
            ),
          ),
          Container(
              child: ElevatedButton(
                  onPressed: (() {
                    _onPressClocking();
                  }),
                  child: const Text(
                    'Clocking',
                    style: TextStyle(fontSize: 21),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  )),
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16)),
        ],
      ),
    );
  }
}
