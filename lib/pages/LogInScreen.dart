import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_left, size: 30)),
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Center(
          child: Column(
              children: [
                Placeholder(fallbackHeight: 150,),
                Text("Image"),
                const SizedBox(height: 20),
                Placeholder(fallbackHeight: 50,),
                Text("Toggle button"),
                const SizedBox(height: 20),
                Text("Glad to see you!", )

              ],
          )
        ),
      ),
    ));
  }
}
