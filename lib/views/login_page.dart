import 'package:flutter/material.dart';
import 'package:focus_app/Utilities/appStyles.dart';
import 'package:focus_app/constants/textBox.dart';
import 'package:focus_app/constants/textButton.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
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
            TextBox(width: 0.9 * width, hintText: "Email",textEditingController: emailController,),
            Gap(0.02 * height),
            TextBox(
              width: 0.9 * width,
              hintText: "Password",
              hideText: true,
              enableSuggestions: false,
              autoCorrect: false,
              textEditingController: passController,
            ),
            Gap(0.025 * height),
            SizedBox(
                height: 0.075 * height,
                width: 0.6 * width,
                child: Textbutton(
                  text: "LogIn",
                  buttonFuction: () {},
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
