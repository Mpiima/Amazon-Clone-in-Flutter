import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sell/screens/sign_in_screen.dart';
import 'package:sell/utils/color_themes.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
 await Firebase.initializeApp(
  options: const FirebaseOptions(
        apiKey: "AIzaSyCMDetSDP_p4pIReFapH2n9vci6PXuDhWw",
        authDomain: "e-clone-97bc1.firebaseapp.com",
        databaseURL: "https://e-clone-97bc1-default-rtdb.firebaseio.com",
        projectId: "e-clone-97bc1",
        storageBucket: "e-clone-97bc1.appspot.com",
        messagingSenderId: "329753372006",
        appId: "1:329753372006:web:2219d8d62cc3f43eabd4a7"
  )
);
  }else{
    Firebase.initializeApp();
  }
  runApp(const AmazoneClone());
}

class AmazoneClone extends StatelessWidget {
  const AmazoneClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amazone Clone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor:backgroundColor
      ),
      home: SignInScreen()
    );
  }
}
