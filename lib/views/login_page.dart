import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:focus_app/Utilities/appStyles.dart';
import 'package:focus_app/constants/textBox.dart';
import 'package:focus_app/constants/textButton.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config/config.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _isNotEmailValidate = false;
  bool _isNotPasswordValidate = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> loginUser() async {
    if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
      var regBody = {
        "email": emailController.text,
        "password": passController.text,
      };
      var response = await http.post(Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));
      var jsonRespose = jsonDecode(response.body);
      if (jsonRespose['status']) {
        
        var UserToken = jsonRespose['token'];
        prefs.setString('token', UserToken);
        
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeView(
                      token: UserToken,
                    )));
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
              "Login Here",
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
                  text: "LogIn",
                  buttonFuction: () {
                    loginUser();
                  },
                )),
            Gap(0.035 * height),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/register");
              },
              child: const Text("Not Registed? Register Here"),
            )
          ]),
        ),
      ),
    );
  }
}
