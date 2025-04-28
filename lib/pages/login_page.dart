import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:schoolchat/constants.dart';
import 'package:schoolchat/pages/chat_page.dart';
import 'package:schoolchat/pages/resgister_page.dart';
import '../widgeta/custom_button.dart';
import '../widgeta/custom_text_field.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});
   static String id = 'Login page';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email ,password;



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
                    Text('LOGIN',
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
                        await LoginUser();
                       Navigator.pushNamed(context, ChatPage.id);
                      }on FirebaseAuthException catch (ex){
                        if(ex.code == 'user-not-found') {
                          showSnackBar(context , 'user not found');
                        }else if(ex.code == 'wrong-password'){
                          showSnackBar(context, 'wrong password');
                        }
                      }catch(ex){
                        print(ex);
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
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return RegisterPage();
                          },),);

                        },
                        child: Text('   Login',
                          style: TextStyle(
                            color: Color(0xffC7EDE6),
                          ),),
                      ),
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

  void showSnackBar(BuildContext context ,String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),),);
  }

  Future<void> LoginUser() async {
    UserCredential user =  await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
