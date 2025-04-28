import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:schoolchat/constants.dart';
import 'package:schoolchat/pages/chat_page.dart';
import '../helper/showsnackBar.dart';
import '../widgeta/custom_button.dart';
import '../widgeta/custom_text_field.dart';


class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
String? email;

String? password;

bool isLoading = false;

GlobalKey<FormState> formKey = GlobalKey();

   @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 30,),

                Image.asset('assets/images/scholar.png', height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('SchoolChat',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25,),

                Row(
                  children: [
                    Text('Sign Up',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],

                ),
                SizedBox(height: 20,),

                CustomFormTextField(
              onChanged: (data){
                   email = data;
            },
                  hintText : 'Email',
                ),
                SizedBox(height: 20,),
                CustomFormTextField(
                  onChanged: (data){
                    password = data;
                  },
                  hintText : 'Password',
                ),
                SizedBox(height: 20,),



                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {
                      });
                      try {
                        await registerUser();
                        Navigator.pushNamed(context, ChatPage.id);
                      }on FirebaseAuthException catch (ex){
                        if(ex.code == 'weak-password') {
                          showSnackBar(context , 'weak password');
                        }else if(ex.code == 'email-already-in-use'){
                          showSnackBar(context, 'email already exists');
                        }
                      }catch(ex){
                        showSnackBar(context, 'there was an error');
                      }
                      isLoading = false;
                      setState(() {
                      });
                    }else {}
                  },
                  text: 'SING UP',
                ),
                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('already have an account',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text('   Login',
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                        ),),
                    ),



                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }




   Future<void> registerUser() async {
     UserCredential user =  await FirebaseAuth.instance
         .createUserWithEmailAndPassword(
         email: email!, password: password!);
   }
}
