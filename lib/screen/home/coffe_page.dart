import 'package:flutter/material.dart';
import 'package:um_qais/constant/colors.dart';
import 'package:um_qais/widget/build_coffe.dart';

class CoffePage extends StatelessWidget {
  const CoffePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: MainColor,title: Text('Coffee' ,style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w600),)),
    body: buildCoffee(context),
    );
  }
}