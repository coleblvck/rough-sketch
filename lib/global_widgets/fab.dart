import 'package:flutter/material.dart';
import 'package:rough_sketch/global_variables.dart';

FloatingActionButton fab({String object="visualizer"}) => FloatingActionButton(
  onPressed: actionButtonActions[object]!["function"],
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
  tooltip: 'Music',
  backgroundColor: Colors.orange,
  child: actionButtonActions[object]!["widget"],
);
