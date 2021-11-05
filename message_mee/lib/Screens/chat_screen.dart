// ignore_for_file: prefer_const_constructors, constant_identifier_names, unrelated_type_equality_checks, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:message_mee/Screens/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String ChatScreenRoute = "chat_screen";
  const ChatScreen({ Key? key }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore=FirebaseFirestore.instance;
  final _auth=FirebaseAuth.instance;
  late User SignInUser;
  String? messageText;

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

//  void GetMessages() async
//  {
//    final messages= await _firestore.collection('messages').get();
//    for(final message in messages.docs)
//    {
//      print(message.data());
//    }
//  }

      void messagesStreem() async
     {
        await for(var snapshot in _firestore.collection("messages").snapshots()) 
        {
          for(final message in snapshot.docs)
          {
            print(message.data());
          }
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
         // _auth.signOut();
         // Navigator.pop(context);
         messagesStreem();
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
                  onChanged: (value){
                    messageText=value;
                  },

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
                TextButton(onPressed: (){
                  _firestore.collection("messages").add({
                    'text':messageText,
                    'sender':SignInUser.email,
                  });

                },
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