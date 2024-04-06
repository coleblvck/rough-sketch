import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:rough_sketch/global_variables.dart';
import 'package:rough_sketch/global_widgets/app_list.dart';
import 'package:rough_sketch/global_widgets/blinders.dart';
import 'package:rough_sketch/global_widgets/boxes.dart';
import 'package:rough_sketch/global_widgets/search.dart';



getAppList() async {

  List <AppInfo> apps =  await InstalledApps.getInstalledApps(
      true,true
  );
  apps.sort((a, b) => a.name.compareTo(b.name),);
  allAppsListStream.add(apps);
  allAppsList = apps;
}

initAppList() async {
  await getAppList();
}


appsLayout(List<AppInfo> allApps) {
  if (layout == "Blinders") {
    return Blinders(allApps: allApps);
  }
  if (layout == "Boxes") {
    return Boxes(allApps: allApps);
  }
}

toggleMenu() {
  menuShown = !menuShown;

  if (menuShown) {
    desktopBox2Child = const AppListBuilder();
  } else {
    desktopBox2Child = Container();
  }
}

search(term) {
  if (menuShown) {
    toggleMenu();
  }
  if (searchController.text != "") {
    desktopBox2Child = SearchBuilder(term: term,);
  } else {
    desktopBox2Child = Container();
  }
}