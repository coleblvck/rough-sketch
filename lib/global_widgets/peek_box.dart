import 'package:flutter/material.dart';
import 'package:rough_sketch/global_variables.dart';

class PeekBox extends StatelessWidget {
  const PeekBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
          scrollDirection: MediaQuery.of(context).orientation == Orientation.portrait? Axis.horizontal: Axis.vertical,
          children: [
            Card(
              color: Colors.purple.withBlue(10).withAlpha(450),
              child: Center(
                child: greetingsWidget(),
              ),
            ),
            Card(
                color: Colors.black.withAlpha(450),
                child: Container(),
            ),
            Card(
              color: Colors.orange.withAlpha(450),
              child: Container(),
            ),
          ],
        );

  }
}

//Move this
greetingsWidget() => Text(greetingText,
style: TextStyle(fontSize: 60,
fontWeight: FontWeight.w900,
),
);