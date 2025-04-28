import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(

        padding: EdgeInsets.only(left: 20, top: 32,bottom: 32, right: 35),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
          color: kPrimaryColor,
        ),
        child: Text('i am a new user xgjdfsrtwe6n',
          style: TextStyle(
            color: Colors.white,
          ),),
      ),
    );
  }
}
