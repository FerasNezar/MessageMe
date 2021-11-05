// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:message_mee/Screens/chat_screen.dart';
import 'package:message_mee/Widgets/My_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String RegistrationScreenRoute = "Registration_Screen";
  const RegistrationScreen({ Key? key }) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth=FirebaseAuth.instance;
  late String Email;
  late String Password;

  bool ShowSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: ShowSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 180,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(
                height: 50,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value){
                  Email=value;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                hintText: "إسم المستخدم",
                contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                ),
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange,
                  width: 1),
                  borderRadius: BorderRadius.all
                  (Radius.circular(10),
                ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                ),
      
                 SizedBox(
                   height: 10,
                 ),
      
      
      
                TextField(
                  obscureText: true,
                onChanged: (value) {
                  Password=value;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "كلمة المرور",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
      
              MyButton(color: Colors.blue[800]!, title: "التسجيل", onPressed: () async{

                setState(() {
                  ShowSpinner = true;
                });
               try{
                 final newUser = await _auth.createUserWithEmailAndPassword(
                 email: Email, password: Password);
                 Navigator.pushNamed(context, ChatScreen.ChatScreenRoute);
                 setState(() {
                   ShowSpinner = false;
                 });
               }
               catch(e){
                print(e);

               }
              })
            ],
          ),
        ),
      ),
    );
  }
}