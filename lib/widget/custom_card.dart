import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:um_qais/constant/colors.dart';

Widget customCard(
    {Color colorCard = MainColor,
    required iconCard,
    required textCard,
    Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 100,
      height: 100,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: colorCard,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconCard,
            SizedBox(
              height: 10,
            ),
            textCard
          ],
        ),
      ),
    ),
  );
}
