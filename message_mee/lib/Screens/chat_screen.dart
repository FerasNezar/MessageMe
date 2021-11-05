// ignore_for_file: prefer_const_constructors, constant_identifier_names, unrelated_type_equality_checks, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:message_mee/Screens/signin_screen.dart';

class ChatScreen extends StatefulWidget {
  static const String ChatScreenRoute = "chat_screen";
  const ChatScreen({ Key? key }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth=FirebaseAuth.instance;
  late User SignInUser;

   @override
  void initState() {
    super.initState();
    getCurrenUser();
  }
  void getCurrenUser()
  {
    try
    {
      final User = _auth.currentUser;
      if (User != Null) {
        SignInUser = User!;
        print(SignInUser.email);
      }
    }
    catch(e)
    {
     print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.yellow[900],
      title: Row(
        children: [
          Image.asset("images/logo.png",height: 25,),
          SizedBox(width: 10,),
          Text("Message Mee")
        ],
      ),
      actions: [IconButton(
        onPressed: (){
          _auth.signOut();
          Navigator.pop(context);
        },
         icon: Icon(Icons.close))],
      ),
      body: SafeArea(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.orange,
                  width: 2,
                )
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: TextField(
                  onChanged: (value){},

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    hintText: "ضع رسالتك هنا...",
                    border: InputBorder.none,
                  ),
                ),
                ),
                TextButton(onPressed: (){},
                 child: Text(
                   "إرسال",
                   style: TextStyle(
                     color: Colors.blue[800],
                     fontWeight: FontWeight.bold,
                     fontSize: 18,
                   ),
                 ),)
              ],
            ),
          ),
        ],
      ),
      ),
      
    );
  }
}