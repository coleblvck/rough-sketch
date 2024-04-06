import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';



Future <List<AppInfo>> getAppList() async {

  List <AppInfo> apps =  await InstalledApps.getInstalledApps(
      true,true
  );
  apps.sort((a, b) => a.name.compareTo(b.name),);
  return apps;
}