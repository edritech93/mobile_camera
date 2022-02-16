// import 'package:flutter/material.dart';
// import 'package:mobile_camera/screens/dashboard.dart';
// import 'package:mobile_camera/screens/login.dart';
// import 'package:mobile_camera/screens/splash.dart';

// void main(List<String> args) {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Haermes',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.deepOrange,
//       ),
//       home: const Splash(),
//       routes: <String, WidgetBuilder>{
//         'Splash': (BuildContext context) => const Splash(),
//         'Login': (BuildContext context) => const Login(),
//         'Dashboard': (BuildContext context) => const Dashboard(),
//       },
//     );
//   }
// }

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'components/camera_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera App',
      home: CameraScreen(cameras: cameras),
    );
  }
}
