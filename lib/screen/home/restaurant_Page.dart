import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:um_qais/constant/colors.dart';
import 'package:um_qais/widget/build_restaurant.dart';

class RestaurantPage extends StatelessWidget {
 // final String? nameTitle;

  const RestaurantPage({Key? key}) : super(key: key);

  Future<QuerySnapshot> fetchHotelsFromFirestore() async {
    // Function to fetch hotels data from Firestore
    return FirebaseFirestore.instance.collection('restaurant').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurants',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: MainColor2,
      ),
      body: FutureBuilder(
        future: fetchHotelsFromFirestore(), // Fetch data from Firestore
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: MainColor2,));
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  return buildRestaurant(
                      context, document); // Pass each document to buildHotels
                }).toList(),
              );
            }
          }
        },
      ),
    );
  }
}

