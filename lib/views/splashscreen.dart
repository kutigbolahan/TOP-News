

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:intro_slider/intro_slider.dart';

// class Splash extends StatelessWidget {
//   static String routeName = 'splash';
//   final pages = [
//     Container(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.only(top: 50, left: 10),
//                     child: Text('Top News',
//                         style: GoogleFonts.blinker(
//                             fontSize: 30, color: Colors.red)),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(top: 50, right: 10),
//                     child: Text('Skip',
//                           style: GoogleFonts.blinker(
//                               fontSize: 25, color: Colors.grey)),
//                   ),
//                 ]),
//             SizedBox(height: 120),
//             Container(
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   'assets/images/6.png',
//                   fit: BoxFit.fitWidth,
//                 )),
//             SizedBox(height: 30),
//             Container(
//               child: Text('Welcome to Top News.',
//                   style: GoogleFonts.blinker(
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                       wordSpacing: 1.5,
//                       color: Colors.black)),
//             ),
//             SizedBox(height: 20),
//             Container(
//               child: Text('Get latest news\nat your finger tips.',
//                   style: GoogleFonts.blinker(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w500,
//                       wordSpacing: 1.5,
//                       color: Colors.grey)),
//             )
//           ],
//         ),
//       ),
//     ),
//     Container(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.only(top: 50, left: 10),
//                     child: Text('Top News',
//                         style: GoogleFonts.blinker(
//                             fontSize: 30, color: Colors.red)),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(top: 50, right: 10),
//                     child: Text('Skip',
//                         style: GoogleFonts.blinker(
//                             fontSize: 25, color: Colors.grey)),
//                   ),
//                 ]),
//             SizedBox(height: 120),
//             Container(
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   'assets/images/7.png',
//                   fit: BoxFit.fitWidth,
//                 )),
//             SizedBox(height: 30),
//             Container(
//               child: Text('BE UPDATED.',
//                   style: GoogleFonts.blinker(
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                       wordSpacing: 1.5,
//                       color: Colors.black)),
//             ),
//             SizedBox(height: 20),
//             Container(
//               child: Text(
//                   'Be updated about the latest\n happenings around the world.',
//                   style: GoogleFonts.blinker(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w500,
//                       wordSpacing: 1.5,
//                       color: Colors.grey)),
//             )
//           ],
//         ),
//       ),
//     ),
//     Container(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.only(top: 50, left: 10),
//                     child: Text('Top News',
//                         style: GoogleFonts.blinker(
//                             fontSize: 30, color: Colors.red)),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(top: 50, right: 10),
//                     child: Text('Skip',
//                           style: GoogleFonts.blinker(
//                               fontSize: 25, color: Colors.grey)),
//                   ),
//                 ]),
//             SizedBox(height: 120),
//             Container(
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   'assets/images/8.png',
//                   fit: BoxFit.fitWidth,
//                 )),
//             SizedBox(height: 30),
//             Container(
//               child: Text('BE INFORMED.',
//                   style: GoogleFonts.blinker(
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                       wordSpacing: 1.5,
//                       color: Colors.black)),
//             ),
//             SizedBox(height: 20),
//             Container(
//               child: Text(
//                   'Read the latest news anywhere,\n anyplace and at anytime.',
//                   style: GoogleFonts.blinker(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       wordSpacing: 1.5,
//                       color: Colors.grey)),
//             )
//           ],
//         ),
//       ),
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             body: LiquidSwipe(
//           pages: pages,
//           fullTransitionValue: 300,
//           enableSlideIcon: false,
//           enableLoop: true,
//           waveType: WaveType.liquidReveal,
//           positionSlideIcon: 0.5,
          
//         ),),);
//   }
// }
class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "ERASER",
        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "assets/images/7.png",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    slides.add(
      new Slide(
        title: "PENCIL",
        description: "Ye indulgence unreserved connection alteration appearance",
        pathImage: "assets/images/7.png",
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      new Slide(
        title: "RULER",
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "assets/images/7.png",
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  void onDonePress() {
    // Do what you want
  }
  @override
  Widget build(BuildContext context) {
    return  IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}