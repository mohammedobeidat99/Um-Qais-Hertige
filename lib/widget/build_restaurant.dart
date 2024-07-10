import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:um_qais/constant/colors.dart';

Widget buildRestaurant(BuildContext context, DocumentSnapshot<Object?> data,) {
    
    return Container(
      decoration: BoxDecoration(
        border:  Border.all( color: MainColor2,width: 1),


        borderRadius: BorderRadius.circular(6.0),

      ),
      
      margin: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Material(
          
          elevation: 10.0,
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                 // Image.asset(Imageback4),
                  Image.network(data['image']),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(
                      Icons.star,
                      color: Colors.grey.shade800,
                      size: 20.0,
                    ),
                  ),
                  const Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      Icons.star_border,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                  // Positioned(
                  //   bottom: 20.0,
                  //   right: 10.0,
                  //   child: Container(
                      
                      
                  //     decoration: BoxDecoration(border: Border.all(color: MainColor2,width: 1),
                  //     borderRadius: BorderRadius.circular(5),
                     
                      
                      
                  //     color: Colors.white,),
                  //     padding: const EdgeInsets.all(10.0),
                      
                  //     child:  Text("${data['price']} JD"),
                  //   ),
                  // )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data['name'],
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold ,color: MainColor2),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                     Text(data['typefood']),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "(${data['reviews']} reviews)",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  


