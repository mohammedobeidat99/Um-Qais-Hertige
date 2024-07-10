import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:um_qais/firebase_options.dart';
import 'package:um_qais/intro_page.dart';
import 'package:um_qais/screen/home/controller_bottonNav.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
       
        
        useMaterial3: true,
      ),
      home: check()//IntroOverboardPage() // ControllerBottomNav(), // TabPage(), //HomePage()  
    );

    
  }
  Widget check(){
      User? user = FirebaseAuth.instance.currentUser;
     return user != null ?  ControllerBottomNav() : IntroOverboardPage() ;

  }
}

