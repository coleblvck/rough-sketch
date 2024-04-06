import 'package:flutter/material.dart';
import 'package:rough_sketch/global_variables.dart';
import 'package:rough_sketch/global_widgets/fab.dart';


class Desktop extends StatefulWidget {
  const Desktop({super.key});


  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: MediaQuery.of(context).orientation == Orientation.portrait? Column(
                  children: [
                    desktopBox1(),
                    Card(
                      color: Colors.orange.withAlpha(450),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.search,
                              size: 30,),
                            ),
                            Expanded(
                              child: TextField(
                                                    decoration: InputDecoration(border: InputBorder.none),
                                                  ),
                            ),
                          ],
                        )),
                    desktopBox2(),
                  ],
                ): Row(
                  children: [
                    desktopBox1(),
                    const VerticalDivider(),
                    desktopBox2(),
                  ],
                ),


        ),
      ),
      floatingActionButton: fabEnabled? fab(): null,
    );
  }

  Expanded desktopBox1() {
    return Expanded(
      flex: 2,
      child: desktopBox1Child,
    );
  }

  Expanded desktopBox2() {
    return Expanded(
      flex: 4,
      child: desktopBox2Child,
    );
  }
}
