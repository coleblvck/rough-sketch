import 'package:flutter/material.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:rough_sketch/global_widgets/blinders.dart';
import 'package:rough_sketch/global_widgets/peek_box.dart';


Widget desktopBox1Child = const PeekBox();
Widget desktopBox2Child = const Blinders();
bool fabEnabled = true;
String greetingText = "Hola";


Map <String, Map<String, dynamic>> actionButtonActions = {
  "visualizer": {
    "widget": MiniMusicVisualizer(
      animate: true,
      radius: 5,
      height: 20,
      width: 10,
      color: Colors.purple.withBlue(10),

    ),
    "function": (){},
  }

};