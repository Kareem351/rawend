import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:schoolchat/pages/chat_page.dart';
import 'package:schoolchat/pages/login_page.dart';
import 'package:schoolchat/pages/resgister_page.dart';

import 'firebase_options.dart';
 void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   runApp(Schoolhat());
 }

class Schoolhat extends StatelessWidget {
  const Schoolhat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
routes: {
  LoginPage.id :(context)=>LoginPage(),
  RegisterPage.id :(context) => RegisterPage(),
  ChatPage.id : (context) => ChatPage(),

},
      initialRoute: LoginPage.id,
    );
  }
}
