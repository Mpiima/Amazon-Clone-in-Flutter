import 'package:flutter/material.dart';
import 'package:sell/screens/sign_up_screen.dart';
import 'package:sell/widgets/text_field_widget.dart';

import '../utils/color_themes.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';
import '../widgets/custom_main_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                Container(
                  height: screenSize.height*0.6,
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
                      Text("Sign-In",
                        style: TextStyle(fontSize:33,fontWeight: FontWeight.w500,),
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
                          onPressed: () {  },
                          child: const Text("Sign In",
                          style: TextStyle(letterSpacing: 0.6,color:Colors.black),),
                        ),
                      ),
                    ],
                  )
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("New to Amazon", style: TextStyle(color: Colors.grey),),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                CustomMainButton(
                    child: Text("Create An Account",style: TextStyle(color:Colors.black),),
                    color: Colors.grey[400]!,
                    isLoading: false,
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return const SignUpScreen();
                      })
                      );
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
