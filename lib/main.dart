import 'package:flutter/material.dart';
import 'package:focus_app/views/home_page.dart';
import 'package:focus_app/views/login_page.dart';
import 'package:focus_app/views/register_page.dart';
import 'package:focus_app/views/sample_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login':(context) => const LoginPage(),
        '/register':(context) => const RegisterPage(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(child:SamplePage());
  }
}
