import 'package:flutter/material.dart';
import 'package:rough_sketch/global_functions.dart';
import 'package:rough_sketch/screens/desktop.dart';

void main() {
  runApp(const RoughSketch());
  //Move to desktop build?
  initAppList();
}

class RoughSketch extends StatelessWidget {
  const RoughSketch({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rough Sketch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Desktop(),
    );
  }
}