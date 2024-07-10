
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:um_qais/constant/colors.dart';
import 'package:um_qais/screen/auth/login_screen.dart';
import 'package:um_qais/screen/auth/sginup_screen.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: MainColor,
            
            
            
            title: const Text('Login & Signup',style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w600),),
            bottom: const TabBar(
              indicatorColor: MainColor2,
            unselectedLabelStyle:TextStyle(color: Colors.white),
            //labelColor: MainColor2,
            labelStyle: TextStyle(color:MainColor2,fontWeight: FontWeight.w500,fontSize: 18 ,),

             
            
           
            
            //dividerColor: Colors.white,
              
              tabs: [
                Tab(text: 'Login' ),
                Tab(text: 'Signup'),
              ],
            ),
          ),
          body:  TabBarView(
            children: [
              LoginPage(),
              SignupPage(),
            ],
          ),
        ),
      )
  ;
  }
}



