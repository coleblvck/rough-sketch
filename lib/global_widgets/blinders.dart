import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';


class Blinders extends StatelessWidget {
  const Blinders({
    super.key,
    required this.allApps,
  });

  final List<AppInfo> allApps;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: allApps.length,
      itemExtent: 60,
      itemBuilder: (context, index) {
        return BlinderItem(appInfo: allApps[index]);
      },
    );
  }
}


class BlinderItem extends StatelessWidget {
  const BlinderItem({
    super.key,
    required this.appInfo
  });
  final AppInfo appInfo;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        GestureDetector(
          onDoubleTap: (){InstalledApps.startApp(appInfo.packageName);},
          child: Card(
            elevation: 5,
            color: Colors.black.withAlpha(450),
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Image.memory(appInfo.icon!)
                    ),
                    Expanded(
                        flex: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(appInfo.name,
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.amber),
                          ),
                        )
                    ),
                  ],
                )
            ),

          ),
        ),
        Card(
          elevation: 5,
          color: Colors.purple.withBlue(10).withAlpha(450),
          child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Image.memory(appInfo.icon!)
                  ),
                  Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(appInfo.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.amber),
                        ),
                      )
                  ),
                  GestureDetector(
                    onTap: (){
                      InstalledApps.openSettings(appInfo.packageName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(
                          RemixIcon.information,
                        size: 28,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      InstalledApps.uninstallApp(appInfo.packageName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(
                        RemixIcon.delete_bin_7,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              )
          ),

        ),
      ],
    );
  }
}