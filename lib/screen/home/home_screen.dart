import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:um_qais/constant/colors.dart';
import 'package:um_qais/constant/image.dart';
import 'package:um_qais/screen/auth/tabconroller.dart';
import 'package:um_qais/screen/home/coffe_page.dart';
import 'package:um_qais/screen/home/hotels_page.dart';
import 'package:um_qais/screen/home/pharmacy_page.dart';
import 'package:um_qais/screen/home/popular_page.dart';
import 'package:um_qais/screen/home/restaurant_Page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:um_qais/widget/custom_card.dart';
import 'package:um_qais/widget/weather_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  _launchGoogleMaps() async {
    const url = 'https://maps.app.goo.gl/6cDic1PXemNqY75d8';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
        // You can also navigate to another screen after logout if needed
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TabPage()));


                },
                icon: Icon(
                  (Icons.exit_to_app_rounded),
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: _launchGoogleMaps,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: MainColor))),
              padding: const EdgeInsets.all(1.5),
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                Imagemap,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(10),
            child: const Text('Weather Umm Qais',
                style: TextStyle(
                    fontSize: 18,
                    color: MainColor,
                    fontWeight: FontWeight.w500)),
          ),
          weatherForecast(),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3, // Number of columns
              crossAxisSpacing: 10, // Spacing between columns
              mainAxisSpacing: 10, // Spacing between rows
              padding: const EdgeInsets.all(10),
              children: [
                customCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RestaurantPage()),
                    );
                  },
                  colorCard: Colors.blue,
                  iconCard: const Icon(
                    Icons.restaurant_menu_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                  textCard: const Text(
                    'Restaurant',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
                customCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HotelPage()),
                    );
                  },
                  colorCard: const Color.fromARGB(255, 245, 8, 87),
                  iconCard: const Icon(
                    Icons.hotel_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  textCard: const Text(
                    'Hotels',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),

                customCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PharmacyPage()));
                  },
                  colorCard: Colors.green,
                  iconCard: const Icon(
                    Icons.medical_services_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  textCard: const Text(
                    'Pharmacy',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),

                customCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CoffePage(),
                        ));
                  },
                  colorCard: MainColor2,
                  iconCard: const Icon(
                    Icons.coffee,
                    color: Colors.white,
                    size: 40,
                  ),
                  textCard: const Text(
                    'Coffe',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),

                

                customCard(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PopularPage(),
                        ));
                  },
                  colorCard: Colors.tealAccent,
                  iconCard: const Icon( 
                    Icons.food_bank_rounded,
                    color: Colors.orange,
                    size: 40,
                  ),
                  textCard: const Text(
                    'Popular food',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),

                // Add more customCard widgets here for more items
              ],
            ),
          ),
        ],
      ),
    );
  }
}
