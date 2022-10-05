import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sell/resources/authentication_methods.dart';
import 'package:sell/screens/sign_in_screen.dart';

import '../utils/color_themes.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';
import '../widgets/custom_main_button.dart';
import '../widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
 AuthenticationMethods authenticationMethods = AuthenticationMethods();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return
      Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(amazonLogo,
                      height: screenSize.height*0.10,),
                    SizedBox(
                      height: screenSize.height*0.7,
                      child:
                      FittedBox(
                        child: Container(
                            height: screenSize.height*0.85,
                            width: screenSize.width*0.8,
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                                border:Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                )
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sign Up",
                                  style: TextStyle(fontSize:33,fontWeight: FontWeight.w500,),
                                ),
                                TextFieldWidget(title: "Name",
                                  controller: nameController,
                                  obsureText: false,
                                  hintText: 'Enter your Name',
                                ),
                                TextFieldWidget(title: "Address",
                                  controller: addressController,
                                  obsureText: false,
                                  hintText: 'Enter your Address',
                                ),
                                TextFieldWidget(title: "Email",
                                  controller: emailController,
                                  obsureText: false,
                                  hintText: 'Enter your Email',
                                ),
                                TextFieldWidget(title: "Password",
                                  controller: passwordController,
                                  obsureText: true,
                                  hintText: 'Enter your password',
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: CustomMainButton(
                                    color: yellowColor,
                                    isLoading: false,
                                    onPressed: () async {
                                     String output = await authenticationMethods.signUpUser(name: nameController.text,
                                          address: addressController.text,
                                          email: emailController.text,
                                          password: passwordController.text);

                                     if(output=="success"){
                                       //functions
                                       print("doing next step");
                                     }else{
                                       //error feedback
                                       print(output);
                                     }
                                    },
                                    child: const Text("Sign Up",
                                      style: TextStyle(letterSpacing: 0.6,color:Colors.black),),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    CustomMainButton(
                        child: Text("Back",style: TextStyle(color:Colors.black),),
                        color: Colors.grey[400]!,
                        isLoading: false,
                        onPressed: (){
                          Navigator.pop(context);
                        }
                    )
                  ],
                ),
              ),),
          ),
        ),
      );

  }
}
