import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Splash extends StatelessWidget {
  final pages = [
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/3.jpg',
                fit: BoxFit.contain,
              )),
          SizedBox(height: 50),
          Container(
            child: Text(
              'data',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    ),
    Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/2.jpg',
                fit: BoxFit.contain,
              )),
          SizedBox(height: 50),
          Container(
            child: Text(
              'data',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    ),
    Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/4.jpg',
                fit: BoxFit.contain,
              )),
          SizedBox(height: 50),
          Container(
            child: Text(
              'data',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    ),

    // Container(

    //   color: Colors.white,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //      mainAxisSize: MainAxisSize.max,
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             Text(
    //               'Top News',
    //               style: GoogleFonts.indieFlower(
    //                   fontSize: 25, fontWeight: FontWeight.bold),
    //             ),
    //             Text(
    //               'Skip',
    //               style: GoogleFonts.indieFlower(
    //                   fontSize: 25, fontWeight: FontWeight.w300),
    //             )
    //           ],
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.all(20),
    //         //  width: 200.0,
    //         // height: 550.0,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.all(Radius.circular(80.0)),
    //         ),
    //         child: Image.asset(
    //           'assets/images/3.jpg',
    //         ),
    //       ),
    //       // Padding(padding: const EdgeInsets.all(20.0)),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal:30.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,

    //           children: <Widget>[
    //             Text(
    //               "Latest",
    //               style: GoogleFonts.indieFlower(
    //                   fontSize: 30, fontWeight: FontWeight.w600),
    //             ),
    //             Text(
    //               "Online News",
    //               style: GoogleFonts.indieFlower(
    //                   fontSize: 30, fontWeight: FontWeight.w600),
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             Text(
    //               "Sahdeep",
    //               style: TextStyle(
    //                   fontSize: 30,
    //                   fontFamily: "Billy",
    //                   fontWeight: FontWeight.w600),
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // ),
    // Container(
    //   color: Colors.white,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     // mainAxisSize: MainAxisSize.max,
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             Text(
    //               'Top News',
    //               style: GoogleFonts.indieFlower(
    //                   fontSize: 25, fontWeight: FontWeight.bold),
    //             ),
    //             Text(
    //               'Skip',
    //               style: GoogleFonts.indieFlower(
    //                   fontSize: 25, fontWeight: FontWeight.w300),
    //             )
    //           ],
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.all(20),
    //         //  width: 200.0,
    //         // height: 550.0,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.all(Radius.circular(80.0)),
    //         ),
    //         child: Image.asset(
    //           'assets/images/2.jpg',
    //         ),
    //       ),
    //       // Padding(padding: const EdgeInsets.all(20.0)),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal:30.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               "Latest",
    //               style: GoogleFonts.indieFlower(
    //                   fontSize: 30, fontWeight: FontWeight.w600),
    //             ),
    //             Text(
    //               "Online News",
    //               style: GoogleFonts.indieFlower(
    //                   fontSize: 30, fontWeight: FontWeight.w600),
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             Text(
    //               "S",
    //               style: TextStyle(
    //                   fontSize: 30,
    //                   fontFamily: "Billy",
    //                   fontWeight: FontWeight.w600),
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // ),
    // Container(

    //   color: Colors.grey,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     // mainAxisSize: MainAxisSize.max,
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: <Widget>[
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             Text(
    //               'Top News',
    //               style: GoogleFonts.indieFlower(
    //                   fontSize: 25, fontWeight: FontWeight.bold),
    //             ),
    //             Text(
    //               'Skip',
    //               style: GoogleFonts.indieFlower(
    //                   fontSize: 25, fontWeight: FontWeight.w300),
    //             )
    //           ],
    //         ),
    //       ),
    //       Container(
    //         padding: EdgeInsets.all(20),
    //         //  width: 200.0,
    //         // height: 550.0,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.all(Radius.circular(80.0)),
    //         ),
    //         child: Image.asset(
    //           'assets/images/4.jpg',
    //         ),
    //       ),
    //       // Padding(padding: const EdgeInsets.all(20.0)),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal:30.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               "Latest",
    //               style: GoogleFonts.indieFlower(
    //                   fontSize: 30, fontWeight: FontWeight.w600),
    //             ),
    //             Text(
    //               "Online News",
    //               style: GoogleFonts.indieFlower(
    //                   fontSize: 30, fontWeight: FontWeight.w600),
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             Text(
    //               "Sahde",
    //               style: TextStyle(
    //                   fontSize: 30,
    //                   fontFamily: "Billy",
    //                   fontWeight: FontWeight.w600),
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: LiquidSwipe(
      pages: pages,
      fullTransitionValue: 300,
      enableSlideIcon: true,
      enableLoop: true,
      waveType: WaveType.liquidReveal,
      positionSlideIcon: 0.5,
    )));
  }
}
