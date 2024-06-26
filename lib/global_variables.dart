import 'dart:async';

import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:rough_sketch/global_widgets/app_list.dart';
import 'package:rough_sketch/global_widgets/blinders.dart';
import 'package:rough_sketch/global_widgets/boxes.dart';
import 'package:rough_sketch/global_widgets/peek_box.dart';


Widget desktopBox1Child = const PeekBox();
Widget desktopBox2Child = Container();//const AppListBuilder();
bool fabEnabled = true;
String greetingText = "Hola";
String fabApp = "com.coleblvck.antiiq";
String layout = "Blinders";
bool menuShowsListOnHome = true;
bool menuShown = false;
TextEditingController searchController = TextEditingController();


StreamController <List<AppInfo>> allAppsListStream = StreamController.broadcast();

List<AppInfo> allAppsList = [];

Map <String, Map<String, dynamic>> actionButtonActions = {
  "visualizer": {
    "widget": MiniMusicVisualizer(
      animate: true,
      radius: 5,
      height: 20,
      width: 10,
      color: Colors.purple.withBlue(10),

    ),
    "function": (){
      if (allAppsList.map((e) => e.packageName).toList().contains(fabApp)){
        InstalledApps.startApp(fabApp);
      }
    },
  }

};