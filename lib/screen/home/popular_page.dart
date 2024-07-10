import 'package:flutter/material.dart';
import 'package:um_qais/constant/colors.dart';
import 'package:um_qais/widget/build_popular.dart';

class PopularPage extends StatelessWidget {
  const PopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: MainColor,title: Text('Popular' ,style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w600),)),
    body: buildPopular(context),
    );
  }
}