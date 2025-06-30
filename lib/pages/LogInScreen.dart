import 'package:flutter/material.dart';
import 'OtpVerificationScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {}, icon: Icon(Icons.keyboard_arrow_left, size: 30)),
      // ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.height * 0.02,
              MediaQuery.of(context).size.height * 0.02,
              MediaQuery.of(context).size.height * 0.02,
              MediaQuery.of(context).size.height * 0.02),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.21,
                    opacity: const AlwaysStoppedAnimation(.3),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                //Toggle button to switch between Phone number and email.
                const Text("Toggle button"),
                const Placeholder(
                  fallbackHeight: 50,
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                const Text(
                  "Glad to see you!",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const Text(
                  "Please provide your phone number",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                Text(
                  'Phone',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                //text field
                TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpVerificationScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        // Set the background color to red
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Set the border radius
                        ),
                        // Set the maximum width
                      ),
                      child: Text(
                        'SEND CODE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                )
              ]))),
    ));
  }
}
