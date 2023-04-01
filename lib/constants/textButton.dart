import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

typedef ButtonFuction = Function();

class Textbutton extends StatelessWidget {
  final String text;
  final ButtonFuction buttonFuction;
  const Textbutton({super.key, required this.text,required this.buttonFuction});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.orange),
        child: TextButton(
            onPressed:buttonFuction,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white,fontSize: 16),
            )));
  }
}
