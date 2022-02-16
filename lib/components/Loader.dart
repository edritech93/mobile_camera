import 'package:flutter/material.dart';

Future<String?> showLoader(BuildContext context) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
          child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CircularProgressIndicator(),
          Text("Loading"),
        ],
      ));
    },
  );
}
