import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Your constants file imports
import 'package:um_qais/constant/colors.dart';
import 'package:um_qais/constant/image.dart';
import 'package:um_qais/screen/home/controller_bottonNav.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  // Text editing controllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('User logged in: ${userCredential.user!.uid}');
      // Navigate to the next screen upon successful login
      // Replace 'NextScreen()' with the screen you want to navigate to after login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ControllerBottomNav()),
        
        
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: MainColor,
          content: Text('Login Successfully')),
      );
    } catch (e) {
      print('Failed to sign in: $e');
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: MainColor,
          content: Text('Failed to sign in. Please check your credentials.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  //topLeft: Radius.circular(60),
                  // topRight: Radius.circular(60),
                  //bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(300),
                ),
                image: DecorationImage(
                  image: AssetImage(Imageback4),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://cdn.pixabay.com/photo/2019/12/24/08/54/flying-dandelions-4716287__340.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey[100]!),
                            ),
                          ),
                          child: TextField(
                            controller: emailController,
                            cursorColor: MainColor,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.person_2_outlined, color: MainColor),
                              border: InputBorder.none,
                              hintText: "Email ",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: passwordController,
                            cursorColor: MainColor,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.lock_outlined, color: MainColor),
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      signInWithEmailAndPassword(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            MainColor,
                            Color.fromRGBO(143, 148, 251, .6),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.login_rounded, color: BackColor),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        print('Forgot Password?');
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: MainColor, fontSize: 13),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


