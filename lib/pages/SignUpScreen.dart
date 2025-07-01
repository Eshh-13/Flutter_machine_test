import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_machine_test_demo/pages/HomeScreen.dart';
import 'package:http/http.dart' as http;

import 'LogInScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  Future<void> register(String email, String password) async {

    try {
      final response = await http.post(
          Uri.parse('https://mock-api.calleyacd.com/api/auth/register'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'email': email, 'password': password}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('logged in successfully');

        //to indicate that the user is registered successfully
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registered successfully"))
        );

        //navigate to the home screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homescreen()),
        );
      }
      if(response.statusCode == 400){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User already exists"))
        );
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
      else {
        print("Response Body: ${response.statusCode} ${response.body}");
      };
    } catch (e) {
      print(e.toString());
    }
  }

  //disposing off the controllers to avoid memory leaks
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {}, icon: Icon(Icons.keyboard_arrow_left, size: 30)),
      // ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(size.height * 0.02, size.height * 0.02,
              size.height * 0.02, size.height * 0.02),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // the top left button, we can also add it in the app bar as shown above.
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    size: 30,
                  )),

              //logo of the brand
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  height: size.height * 0.2,
                  width: size.height * 0.21,
                  opacity: const AlwaysStoppedAnimation(.3),
                ),
              ),

              SizedBox(height: size.height * 0.01),

              const Text(
                "Let's Begin!",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Text(
                "Please enter your credentials to proceed",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),

              SizedBox(
                height: size.height * 0.05,
              ),

              TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text('Your email',
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  )),

              SizedBox(
                height: size.height * 0.02,
              ),

              TextField(

                  controller: passwordController,
                  obscureText: isObscure,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: Text('Create Password ',
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  )),

              SizedBox(
                height: size.height * 0.02,
              ),

              TextField(
                  //controller: ,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text('Referral Code (Optional)',
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  )),
              SizedBox(
                height: size.height * 0.2,
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    width: size.width * 0.15,
                    height: size.height * 0.065,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        register(emailController.text, passwordController.text);

                        // if(response.statusCode == 200){
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => HomeScreen()),
                        //   );
                        // }
                      },
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.white,
                    )),
              )
            ]),
          )),
    ));
  }
}
