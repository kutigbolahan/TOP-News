import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class Splash extends StatelessWidget {
  final pages = [
    Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50,left: 10),
                child: Text('Top News', style: GoogleFonts.blinker(fontSize: 30,
                color: Colors.red
                )),
              ),
              Container(
                padding: EdgeInsets.only(top: 50, right: 10),
                child: Text('Skip', style: GoogleFonts.blinker(fontSize: 25,
                
                )),
              ),
            ]),
            SizedBox(height: 120),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/6.png',
                  fit: BoxFit.contain,
                )),
            SizedBox(height: 30),
             Container(
              child: Text(
                  'BE \n UPDATED.',
                  style: GoogleFonts.blinker(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1.5,
                      color: Colors.grey
                      )),
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                  'Be updated about the latest \n happening around the world.',
                  style: GoogleFonts.blinker(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 1.5,
                      color: Colors.black
                      )),
            )
          ],
        ),
      ),
    ),
    Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/1.jpg',
                fit: BoxFit.contain,
              )),
          SizedBox(height: 30),
          Container(
            child: Text('Top News',
                style: GoogleFonts.blinker(fontSize: 35, color: Colors.white)),
          ),
          SizedBox(height: 30),
          Container(
            child: Text(
                'Read the latest news\n anywhere,anyplace\n and at anytime.',
                style: GoogleFonts.blinker(
                  fontSize: 25,
                  fontWeight: FontWeight.w200,
                  wordSpacing: 1.5,
                  color: Colors.white,
                )),
          )
        ],
      ),
    ),
    Container(
      color: Colors.black,
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
          SizedBox(height: 30),
          Container(
            child: Text('Top News',
                style: GoogleFonts.blinker(fontSize: 35, color: Colors.white)),
          ),
          SizedBox(height: 30),
          Container(
            child: Text('Latest news at your finger tips.',
                style: GoogleFonts.blinker(
                    fontSize: 25,
                    fontWeight: FontWeight.w200,
                    wordSpacing: 1.5,
                    color: Colors.white)),
          )
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
