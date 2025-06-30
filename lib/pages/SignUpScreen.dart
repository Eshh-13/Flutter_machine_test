import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure = true;

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
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.21,
                opacity: const AlwaysStoppedAnimation(.3),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.01),

            const Text(
              "Let's Begin!",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text(
              "Please enter your credentials to proceed",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),

            TextField(
                //controller: ,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text('Your email',
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                )),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            TextField(
                //controller: ,
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
              height: MediaQuery.of(context).size.height * 0.02,
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
              height: MediaQuery.of(context).size.height * 0.2,
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.065,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white,
                  )),
            )
          ])),
    ));
  }
}
