import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:um_qais/constant/colors.dart';

 Widget hotelPackage(BuildContext context, DocumentSnapshot<Object?> data,) {


  
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
    child: Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 4.0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              height: 130,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(data['image']),
                  //image: AssetImage(Imageback1),
                  
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data['name'],
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${data['rate']} star hotel in Umm Qais',
                  // hotels[index].description!,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '\JOD ${data['price']} / Night',
                  style: const TextStyle(fontSize: 16, color: MainColor),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.directions_car, color: MainColor),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.hot_tub, color: MainColor),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.local_bar, color: MainColor),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.wifi, color: MainColor),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Positioned(
          //   bottom: 100,
          //   left: 280,
          //   child: Center(
          //     // child: Transform.rotate(
          //     //  angle: pi / -1,
          //     child: Container(
          //       height: 50,
          //       width: 70,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10.0),
          //         color: MainColor2,
          //         boxShadow: const [
          //           BoxShadow(
          //             color: Colors.black26,
          //             blurRadius: 15.0,
          //             offset: Offset(2.0, 4.4),
          //           ),
          //         ],
          //       ),
          //       child: const Center(
          //         child: Text(
          //           'Booking',
          //           style: TextStyle(
          //               fontSize: 12.0,
          //               color: Colors.white,
          //               fontWeight: FontWeight.w600,
          //               letterSpacing: .1),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // )
        ],
      ),
    ),
  );
}
