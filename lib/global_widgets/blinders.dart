import 'package:flutter/material.dart';
import 'package:rough_sketch/global_functions.dart';
import 'package:rough_sketch/global_widgets/app_list.dart';

class Blinders extends StatelessWidget {
  const Blinders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: getAppList(), builder: (context, data) {
      if(data.hasData){return AppList(allApps: data.data!);}
      return const Center(child: CircularProgressIndicator());

    });
  }
}

