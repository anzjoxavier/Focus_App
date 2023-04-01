import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextBox extends StatelessWidget {
  final double width;
  final String hintText;
  final bool hideText;
  final bool autoCorrect;
  final bool enableSuggestions;
  final String? errorText;
  final TextEditingController? textEditingController;
  const TextBox(
      {super.key,
      required this.width,
      required this.hintText,
      this.textEditingController,
      this.hideText = false,
      this.autoCorrect = true,
      this.enableSuggestions = true,this.errorText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        obscureText: hideText,
        autocorrect: autoCorrect,
        enableSuggestions: enableSuggestions,
        controller: textEditingController,
        decoration: InputDecoration(
          errorText: errorText,
          border: const OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
