import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';


class Splash extends StatelessWidget {
  final pages = [
   Container(
     color: Colors.white,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         Row(
          children: <Widget>[
            Text('Top News', style: GoogleFonts.indieFlower(
               fontSize: 25
            ),)
          ],
         ),
        //  Image.asset(
        //    'assets/images/1.jpg',
        //    fit: BoxFit.cover
        //    ,
        //  ),
         Padding(padding: const EdgeInsets.all(20.0)),
         Column(
           children: <Widget>[
             new Text(
               "Hi",
               style: TextStyle(
                   fontSize: 30,
                   fontFamily: "Billy",
                   fontWeight: FontWeight.w600),
             ),
             new Text(
               "It's Me",
               style: TextStyle(
                   fontSize: 30,
                   fontFamily: "Billy",
                   fontWeight: FontWeight.w600),
             ),
             new Text(
               "Sahdeep",
               style: TextStyle(
                   fontSize: 30,
                   fontFamily: "Billy",
                   fontWeight: FontWeight.w600),
             ),
           ],
         )
       ],
     ),
   ),
   Container(
     color: Colors.deepPurpleAccent,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         Image.asset(
           'assets/1.png',
           fit: BoxFit.cover,
         ),
         Padding(padding: const EdgeInsets.all(20.0)),
         Column(
           children: <Widget>[
             new Text(
               "Take a",
               style: TextStyle(
                   fontSize: 30,
                   fontFamily: "Billy",
                   fontWeight: FontWeight.w600),
             ),
             new Text(
               "look at",
               style: TextStyle(
                   fontSize: 30,
                   fontFamily: "Billy",
                   fontWeight: FontWeight.w600),
             ),
             new Text(
               "Liquid Swipe",
               style: TextStyle(
                   fontSize: 30,
                   fontFamily: "Billy",
                   fontWeight: FontWeight.w600),
             ),
           ],
         )
       ],
     ),
   ),
   Container(
     color: Colors.greenAccent,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         Image.asset(
           'assets/1.png',
           fit: BoxFit.cover,
         ),
         Padding(padding: const EdgeInsets.all(20.0)),
         Column(
           children: <Widget>[
             new Text(
               "Liked?",
               style: TextStyle(
                   fontSize: 30,
                   fontFamily: "Billy",
                   fontWeight: FontWeight.w600),
             ),
             new Text(
               "Fork!",
               style: TextStyle(
                   fontSize: 30,
                   fontFamily: "Billy",
                   fontWeight: FontWeight.w600),
             ),
             new Text(
               "Give Star!",
               style: TextStyle(
                   fontSize: 30,
                   fontFamily: "Billy",
                   fontWeight: FontWeight.w600),
             ),
           ],
         )
       ],
     ),
   ),
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
           ))
    );
  }
}