import 'package:flutter/material.dart';
import 'package:flutter_machine_test_demo/pages/LogInScreen.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:slide_countdown/slide_countdown.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  Duration duration = Duration(seconds: 15);
  bool canResend = false;

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
                'We have sent a unique OTP number \n to your mobile +91-9765232817',
                style: TextStyle(fontSize: 18, color: Colors.grey)),

            SizedBox(
              height:  size.height * 0.06,
            ),

            OtpTextField(
              numberOfFields: 4,
              borderColor: Colors.black,
              showFieldAsBox: true,
              fieldWidth:  size.height * 0.06,
              margin: EdgeInsets.only(right: 20, left: 20),
              enabledBorderColor: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderWidth: 1,
              clearText: true,
              focusedBorderColor: Colors.red,
              onCodeChanged: (String OTP) {},
              onSubmit: (String VerificationCode) {
                print(VerificationCode);
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
    ));
  }
}
