// ignore_for_file: deprecated_member_use, prefer_const_constructors, unused_import, use_key_in_widget_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:message_mee/Screens/Signin_Screen.dart';
import 'package:message_mee/Screens/chat_screen.dart';
import 'Screens/Welcome_Screen.dart';
import 'Screens/Regitration_Screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message App',
      theme: ThemeData(
        primarySwatch: Colors.blue
     ),
      initialRoute: 'Welcome_Screen',
    routes: {
      WelcomeScreen.WelcomeScreenRoute: (context) => WelcomeScreen(),
      SignInScreen.SignInScreenRoute: (context) => SignInScreen(),
      RegistrationScreen.RegistrationScreenRoute: (context) =>
      RegistrationScreen(),
      ChatScreen.ChatScreenRoute: (context) => ChatScreen(),
    },
  );
 }
}