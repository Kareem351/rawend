import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolchat/constants.dart';

import '../widgeta/chat_buble.dart';

class ChatPage extends StatelessWidget {

static String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
     automaticallyImplyLeading: false,
     backgroundColor: kPrimaryColor,
     title: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Image.asset(kLogo,
         height: 65,),
         Text(' Chat',style:
         TextStyle(color:
             Colors.white
         ),),
       ],
     ),
     centerTitle: true,
   ),
      body: ListView.builder(
          itemBuilder: (context , index){
            return ChatBuble();
          }
      ),
    );
  }
}
