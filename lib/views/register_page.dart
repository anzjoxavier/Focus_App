import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:focus_app/Utilities/appStyles.dart';
import 'package:focus_app/config/config.dart';
import 'package:focus_app/constants/textBox.dart';
import 'package:focus_app/constants/textButton.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _isNotEmailValidate = false;
  bool _isNotPasswordValidate = false;
  void registerUser() async {
    if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
      var regBody = {
        "email": emailController.text,
        "password": passController.text,
      };
      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));
      var jsonRespose = jsonDecode(response.body);
      print(jsonRespose['status']);
      if (jsonRespose['status']) {
        Navigator.pushNamed(context, '/login');
      } else {
        print("Something Went Wrong");
      }
    } else if (emailController.text.isEmpty) {
      setState(() {
        _isNotEmailValidate = true;
      });
    } else if (passController.text.isEmpty) {
      setState(() {
        _isNotPasswordValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Styles.backgroundColour,
        body: Center(
          child: Column(children: [
            Gap(0.02 * height),
            const Text(
              "Register Here",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Gap(0.02 * height),
            TextBox(
              width: 0.9 * width,
              hintText: "Email",
              textEditingController: emailController,
              errorText: _isNotEmailValidate ? "Enter email correctly" : null,
            ),
            Gap(0.02 * height),
            TextBox(
              width: 0.9 * width,
              hintText: "Password",
              hideText: true,
              enableSuggestions: false,
              autoCorrect: false,
              textEditingController: passController,
              errorText:
                  _isNotPasswordValidate ? "Enter Password correctly" : null,
            ),
            Gap(0.025 * height),
            SizedBox(
                height: 0.075 * height,
                width: 0.6 * width,
                child: Textbutton(
                  text: "Register",
                  buttonFuction: () {
                    registerUser();
                  },
                )),
            Gap(0.035 * height),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('/login');
              },
              child: const Text("Already Registed? Login Here"),
            )
          ]),
        ),
      ),
    );
  }
}
