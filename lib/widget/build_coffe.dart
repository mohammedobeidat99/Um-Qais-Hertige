import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:um_qais/constant/colors.dart';

Widget buildCoffee(BuildContext context) {
  return FutureBuilder(
    future: FirebaseFirestore.instance.collection('coffees').get(), // Fetch data from Firestore
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(color: MainColor2));
      } else {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(12.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: 0.7,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot doc = snapshot.data!.docs[index];
              return Container(
                height: 250,
                width: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 140.0,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(doc['image']), // Assuming 'image' is the field in your Firestore document containing the image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        doc['name'], // Assuming 'name' is the field in your Firestore document containing the coffee name
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(children: [
                        Icon((Icons.coffee_maker_sharp) ,color: MainColor,),
                        Icon((Icons.games) ,color: MainColor,),


                      ],),
                      // child: Text(
                      //   'cofee mmmmm',
                      // //  doc['description'], // Assuming 'description' is the field in your Firestore document containing the coffee description
                      //   style: const TextStyle(fontSize: 13.0, color: Colors.grey),
                      // ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${doc['time']}', // Assuming 'price' is the field in your Firestore document containing the coffee price
                            style: const TextStyle(color: MainColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                Text(
                                  '${doc['rating']}', // Assuming 'rating' is the field in your Firestore document containing the coffee rating
                                  style: const TextStyle(color: MainColor),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.green,
                                  size: 16.0,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
      }
    },
  );
}
