import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:um_qais/constant/image.dart';



class HotelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('hotels').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return buildHotel(context, data);
          }).toList(),
        );
      },
    );
  }

  Widget buildHotel(BuildContext context, Map<String, dynamic> data) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1),
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
                  Image.asset(
                    Imageback1,
                    //data['image'], // Assuming you have an 'image' field in Firestore containing the image URL
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(
                      Icons.star,
                      color: Colors.grey.shade800,
                      size: 20.0,
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      Icons.star_border,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 10.0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        data['salry'], // Assuming you have a 'price' field in Firestore
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data['title'], // Assuming you have a 'title' field in Firestore
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue), // Change color as needed
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(data['subtitle']), // Assuming you have a 'location' field in Firestore
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
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
                          "(${data['reviews']} reviews)", // Assuming you have a 'reviews' field in Firestore
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
}

