
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:um_qais/constant/colors.dart';
import 'package:um_qais/constant/image.dart';
import 'package:um_qais/widget/build_hotes.dart';

class Hotel {
  String? imageUrl;
  String? title;
  String? description;
  int? price;
  double? rating;

  Hotel({this.description, this.imageUrl, this.price, this.rating, this.title});
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: ImageTesthotels,
    title: 'Test Hotel',
    description: 'A Four Start Hotel in Bara',
    price: 180,
    rating: 4.5,
  ),
  Hotel(
    imageUrl: ImageTesthotels,
    title: 'Hotel Test',
    description: 'A five star Hotelin Kathmandu',
    price: 140,
    rating: 4.5,
  ),
  Hotel(
    imageUrl: ImageTesthotels,
    title: 'Test Hotel',
    description: 'A five Star hotel in Kathmandu',
    price: 65,
    rating: 4.5,
  ),
  Hotel(
    imageUrl: ImageTesthotels,
    title: 'Test Hotel',
    description: 'A Five star hotel in thamel',
    price: 180,
    rating: 4.5,
  )
];

class HotelPage extends StatefulWidget {

  const HotelPage({super.key});

  @override
  _HotelPageState createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  Future<QuerySnapshot> fetchHotelsFromFirestore() async {
    // Function to fetch hotels data from Firestore
    return FirebaseFirestore.instance.collection('hotels').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColor,
        title: const Text(
          'Hotels',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        children: <Widget>[
          //window for search

          //popular hotel
          const SizedBox(
            height: 30.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Popular Hotel',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: MainColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 240,
            width: double.infinity,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: 180,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      // BoxShadow(
                      //   color: Colors.black12,
                      //   offset: Offset(0.0, 4.0),
                      //   blurRadius: 10.0,
                      // )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 140.0,
                        width: 170.0,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(hotels[index].imageUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          hotels[index].title!,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          hotels[index].description!,
                          style: const TextStyle(
                              fontSize: 13.0, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '\JOD${hotels[index].price} / night',
                              style: const TextStyle(color: MainColor),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '${hotels[index].rating}',
                                    style: const TextStyle(color: MainColor),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: MainColor,
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
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Hotel Packages',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: MainColor),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),

          FutureBuilder(
            future: fetchHotelsFromFirestore(), // Fetch data from Firestore
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: MainColor2));
              } else {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      return hotelPackage(context,
                          document); // Pass each document to buildHotels
                    }).toList(),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
