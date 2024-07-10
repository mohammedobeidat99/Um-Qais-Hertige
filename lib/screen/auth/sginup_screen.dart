import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth package
import 'package:um_qais/constant/colors.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key});

  Future<void> _createAccount(BuildContext context, String fullName, String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(backgroundColor: MainColor,
          content: Text('User created successfully ,Go to the login page'))
      );

      print('User created successfully');
      // Navigate to the next screen or perform any other action upon successful signup
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(backgroundColor: MainColor,
          content: Text('Failed to create user'))
      );
      print('Failed to create user: $e');
      // Handle errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    String fullName = '';
    String email = '';
    String password = '';

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: MainColor),
            ),
            elevation: 10,
            margin: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 25,
                        color: MainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextField(
                    onChanged: (value) {
                      fullName = value;
                    },
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.person_outline, color: MainColor,),
                      labelText: 'Full Name',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.email_outlined, color: MainColor,),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.lock_outline, color: MainColor,),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _createAccount(context, fullName, email, password);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [MainColor, Color.fromRGBO(143, 148, 251, .6)],
                        ),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Signup",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.how_to_reg_outlined,
                              color: BackColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
