import 'package:flutter/material.dart';
import 'package:flutter_machine_test_demo/pages/LogInScreen.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:slide_countdown/slide_countdown.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  Duration duration = Duration(seconds: 90);
  bool canResend = false;

  Future<void> verifyOtp(String otp) async {
    final String email = widget.email; // Get the email from the widget

    try{
      final response = await http.post(Uri.parse('https://mock-api.calleyacd.com/api/auth/verify-otp'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'email': email, 'otp': otp}));
      if(response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Verified successfully"),
          behavior: SnackBarBehavior.floating,
          )
        );
        print('verified otp successfully');

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid OTP"))
        );
        print('invalid otp');
      }
      }catch(e){
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            icon: Icon(
              Icons.chevron_left,
              size: 30,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
           size.height * 0.02,
           size.height * 0.02,
           size.height * 0.02,
           size.height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              Image.asset('assets/phone_number_otp.png'),
          
              SizedBox(
                height: size.height * 0.05,
              ),
          
              const Text(
                'OTP Verification',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
          
              SizedBox(
                height:  size.height * 0.01,
              ),
          
              const Text(
                  'We have sent a unique OTP number \n to your email',
                  style: TextStyle(fontSize: 18, color: Colors.grey)),
          
              SizedBox(
                height:  size.height * 0.06,
              ),
          
              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.black,
                showFieldAsBox: true,
                fieldWidth:  size.height * 0.05,
                enabledBorderColor: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderWidth: 1,
                clearText: true,
                focusedBorderColor: Colors.red,
                onCodeChanged: (String OTP) {},
                onSubmit: (String VerificationCode) {
                  verifyOtp(VerificationCode);
                },
              ),
          
              SizedBox(
                height:  size.height * 0.03,
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  canResend
                      ? SizedBox(
                          width:  size.height * 0.05,
                        )
                      : SlideCountdownSeparated(
                          duration: duration,
                          onDone: () {
                            setState(() {
                              canResend = true;
                            });
                          },
                          separator: ' : ',
                          decoration: BoxDecoration(color: Colors.transparent),
                          separatorStyle:
                              TextStyle(fontSize: 18, color: Colors.black),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                  SizedBox(
                    width:  size.height * 0.2,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        canResend = true;
                      });
                    },
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'SEND AGAIN',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: canResend ? Colors.black : Colors.grey),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
