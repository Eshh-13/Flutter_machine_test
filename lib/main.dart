import 'package:flutter/material.dart';
import 'package:flutter_machine_test_demo/pages/LogInScreen.dart';
import 'package:flutter_machine_test_demo/pages/OtpVerificationScreen.dart';
import 'package:flutter_machine_test_demo/pages/SignUpScreen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  LoginScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}

