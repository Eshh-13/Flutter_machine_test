import 'package:flutter/material.dart';
import 'OtpVerificationScreen.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  int selectedIndex = 0; // 0 = phone | 1 = email

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

                //logo of the company
                Center(
                  child: Image.asset(
                    "assets/logo.png",
                    height: size.height * 0.2,
                    width: size.height * 0.21,
                    opacity: const AlwaysStoppedAnimation(.3),
                  ),
                ),

                SizedBox(height: size.height * 0.01),

                //Toggle button to switch between Phone number and email.
                Center(
                  child: AnimatedToggleSwitch<int>.size(
                    current: selectedIndex,
                    values: const [0, 1],
                    iconOpacity: 0.2,
                    indicatorSize: const Size.fromWidth(100),
                    iconAnimationType: AnimationType.onSelected,
                    styleAnimationType: AnimationType.onSelected,
                    onChanged: (i) {
                      setState(() {
                        selectedIndex = i;
                      });
                    },
                    iconBuilder: (i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10.0),
                        child: Text(
                          i == 0 ? "Phone" : "Email",
                          style: TextStyle(
                            fontSize: 12,
                            color: selectedIndex == i
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                    style: ToggleStyle(
                      backgroundColor: Colors.grey[300],
                      borderColor: Colors.transparent,
                      indicatorColor: Colors.red,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.04),
                const Text(
                  "Glad to see you!",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Text(
                  "Please provide your phone number",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),

                SizedBox(
                  height: size.height * 0.05,
                ),

                Text(
                  selectedIndex == 0 ? "Phone" : "Email",
                  // Display the selected option
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                //text field
                TextField(
                  controller: selectedIndex == 0 ? phoneController : emailController,
                    keyboardType: selectedIndex == 0 // Check the selected index
                        ? TextInputType.number
                        : TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    )),
                SizedBox(
                  height: size.height * 0.05,
                ),

                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: size.height * 0.07,
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
                      child: const Text(
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
