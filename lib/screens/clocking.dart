import 'package:flutter/material.dart';
import 'package:mobile_camera/components/ItemClocking.dart';

class Clocking extends StatefulWidget {
  const Clocking({Key? key}) : super(key: key);

  @override
  State<Clocking> createState() => _ClockingState();
}

class _ClockingState extends State<Clocking> {
  final List<String> dataClocking = <String>['A', 'B', 'C'];

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
            flex: 1,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return const ItemClocking();
                }),
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
