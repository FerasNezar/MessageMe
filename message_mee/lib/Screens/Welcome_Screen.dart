// ignore_for_file: file_names, sized_box_for_whitespace, use_key_in_widget_constructors, constant_identifier_names


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:message_mee/Screens/Signin_Screen.dart';
import 'package:message_mee/Widgets/My_Button.dart';

import 'Regitration_Screen.dart';

class WelcomeScreen extends StatefulWidget {
static const String WelcomeScreenRoute="Welcome_Screen";
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                 child: Image.asset("images/logo.png"),
                ),
                // ignore: prefer_const_constructors
                Text("MessageMe",
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 40,
                fontWeight: FontWeight.w900,
                // ignore: prefer_const_constructors
                color: Color(0xff2e386b)),)
              ],
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 20,),
            // ignore: prefer_const_constructors
            MyButton(
              color: Colors.yellow[900]!,
              title: "تسجيل الدخول",
              onPressed: (){
                Navigator.pushNamed(context, SignInScreen.SignInScreenRoute);
              },

            ),
            MyButton(
              color: Colors.blue[800]!,
               title: "التسجيل الآن",
                onPressed: (){
                
                Navigator.pushNamed(context,RegistrationScreen.RegistrationScreenRoute);

                },)
          ],
        ),
      ),
    );
  }
}

