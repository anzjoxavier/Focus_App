import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  late double width;
  late double height;
  double boxWidth = 150;
  double boxHeight = 150;
  int flagState = 0;
  void changeBoxSize(BuildContext context) {
    setState(() {
      if (flagState == 0) {
        boxHeight =width * 0.75;
        boxWidth = width * 0.75;
        flagState = 1;
      } else {
        boxHeight =width * 0.45;
        boxWidth = width * 0.45;
        flagState = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // boxWidth = width * 0.45;
    // boxHeight = width * 0.45;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 170, 251),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                changeBoxSize(context);
              },
              child: AnimatedContainer(
                duration: Duration(microseconds: 3000),
                height: boxHeight,
                width: boxWidth,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Container(
               height: width * 0.45,
                width: width * 0.45,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
      ),
    ));
  }
}
