import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nigeriannews/model/slidemodel.dart';

import 'package:nigeriannews/views/sports.dart';


class SlideItem extends StatelessWidget {
  final int index;

  const SlideItem(this.index, );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
       
        Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
              // shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(slideList[index].imageUrl),
                  fit: BoxFit.contain)),
        ),
        SizedBox(height: 30),
        Text(
          slideList[index].title,
          style: GoogleFonts.montserrat(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          slideList[index].description,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 40,),
        Container(
          width: 250,
          child: FlatButton(
            color: Colors.black,
            
            child: Text('Get Started'),
            onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Sports()), (route) => false) ;   // (context, MaterialPageRoute(builder: (context)=> Sports( )));
            }),
        )
      ],
    );
  }
}
