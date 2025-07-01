import 'dart:ui';

import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  //final Color color;
  final String title;
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String age;

  const Info({super.key, required this.title, required this.name, required this.lastName, required this.email, required this.phone, required this.age}); //required this.color});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      color: Colors.blue,
      elevation: 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$title $name $lastName' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: size.width * 0.02),
                Text('Email: $email'),
                SizedBox(height: size.width * 0.02),
                Text('Phone: $phone'),
                SizedBox(height: size.width * 0.02),
                Text('Age: $age')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
