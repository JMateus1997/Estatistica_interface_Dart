import 'package:estatistica_interface/screens/Dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterEstatisticaApp());
}

class FlutterEstatisticaApp extends StatelessWidget {
  const FlutterEstatisticaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black, primary: Colors.amber,
          secondary: Colors.black,),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.amber,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}