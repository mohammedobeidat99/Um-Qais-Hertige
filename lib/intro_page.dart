import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:um_qais/constant/colors.dart';
import 'package:um_qais/constant/image.dart';
import 'package:um_qais/screen/auth/tabconroller.dart';


class IntroOverboardPage extends StatefulWidget {
  //static const routeName = '/IntroOverboardPage';

  @override
  _IntroOverboardPageState createState() => _IntroOverboardPageState();
}

class _IntroOverboardPageState extends State<IntroOverboardPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        // nextText: 'التالي',
        // skipText: 'تخطي ',
        // finishText: 'انهاء',
        activeBulletColor:MainColor ,
        inactiveBulletColor: Colors.grey  ,
        buttonColor: MainColor,
        allowScroll: true,
        pages: pages,
        showBullets: true,
        skipCallback: () {
          // ignore: unused_label
          content:
          const Text("Skip clicked");
          // _globalKey.currentState?.showSnackBar(SnackBar(
          //   content: Text("Skip clicked"),
          // ));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const TabPage(),
              ));
        },
        finishCallback: () {
          // ignore: unused_label
          content:
          const Text("Finish clicked");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const TabPage(),
              ));

          // _globalKey.currentState?.showSnackBar(SnackBar(
          //   content: Text("Finish clicked"),
          // ));
        },
      ),
    );
  }

  final List<PageModel> pages = [
  
    PageModel(
      bodyColor: Colors.black,
      titleColor: Colors.black,
      color: Color.fromARGB(255, 255, 255, 254),
      imageAssetPath:Imageintro1,
     title: 'Where is Umm Qais',
      body: 'Umm Qais is located 28 km north of Irbid, and it is the largest city in the Bani Kenana District in Irbid Governorate.',
      doAnimateImage: true,
    ),
    PageModel(
      bodyColor: Colors.black,
      titleColor: Colors.black,
      color: Color.fromARGB(255, 255, 255, 254),
      imageAssetPath: Imageintro2,
      title: 'What is there in Umm Qais?',
body: 'Among the most prominent archaeological monuments contained in the site are the northern and western theatres, the Churches Square, the balcony, the main street, the Path of the Nymphs, the Royal Cemetery, and the Tiberias Gate.',      doAnimateImage: true,
    ),
    PageModel(
        bodyColor: Colors.black,

        // doAnimateImage: true,
        titleColor: Colors.black,
        color: Color.fromARGB(255, 255, 255, 254),
        imageAssetPath:Imageintro3,
        title: 'Why was Umm Qais built?',
        body:'It had a special status because it was the connecting point between trade routes between Palestine and Syria.',)
  ];
}
