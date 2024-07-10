import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:um_qais/constant/colors.dart';

class PharmacyPage extends StatefulWidget {
  @override
  _PharmacyPageState createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MainColor,
        title: Text('Pharmacies', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('pharmacies').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot pharmacy = snapshot.data!.docs[index];
              return Container(margin: EdgeInsets.all(10),
                //padding: EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: MainColor,width: 1)
              ),
                child: ListTile(
                  title: Text(pharmacy['name']),
                  
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Opening Time: ${pharmacy['openingTime']}'),
                      Text('Closing Time: ${pharmacy['closingTime']}'),
                      //Text('Phone Number: ${pharmacy['phoneNumber']}'),
                    ],
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: MainColor,
                    child: Icon(
                       Icons.medical_services_outlined, color: Colors.white, size: 25,),
                      
                    ),
                  
                  trailing: IconButton(
                    icon: Icon(Icons.phone ,color: MainColor,),
                    onPressed: () {
                      _launchURL('tel:${pharmacy['phoneNumber']}');
                    },
                  ), 
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

 

  
}
