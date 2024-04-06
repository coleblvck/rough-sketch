import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';

void main() {
  runApp(const RoughSketch());
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





class Desktop extends StatefulWidget {
  const Desktop({super.key});


  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {

  Future <List<AppInfo>> getApps() async {

    List <AppInfo> apps =  await InstalledApps.getInstalledApps(
      true,true
    );
    apps.sort((a, b) => a.name.compareTo(b.name),);
    return apps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: OrientationBuilder(
            builder: (context, orientation){
              return orientation == Orientation.portrait? Column(
              children: [
                PeekBox(),
                listBox(),
              ],
            ): Row(
                children: [
                  PeekBox(),
                  listBox(),
                ],
              );
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        tooltip: 'Music',
        backgroundColor: Colors.orange,
        child: const MiniMusicVisualizer(
          color: Colors.red,
          radius: 5,
          width: 10,
          height: 20,
          animate: true,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Expanded listBox() {
    return Expanded(
                flex: 4,
                  child: FutureBuilder(future: getApps(), builder: (context, data) {
                    if(data.hasData){return AppList(allApps: data.data!);}
                    return Center(child: CircularProgressIndicator());
          
                  }),
              );
  }
}

class PeekBox extends StatelessWidget {
  const PeekBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Card(
        color: Colors.black.withAlpha(450),
        child: Container(),
      ),
    );
  }
}

class AppList extends StatelessWidget {
  const AppList({
    super.key,
    required this.allApps,
  });

  final List<AppInfo> allApps;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
        itemCount: allApps.length,
        itemExtent: 60,
        itemBuilder: (context, index) {
          return AppListItem(appInfo: allApps[index]);
        },
    );
  }
}

class AppListItem extends StatelessWidget {
  const AppListItem({
    super.key,
    required this.appInfo
  });
  final AppInfo appInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
