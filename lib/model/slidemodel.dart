import 'package:flutter/foundation.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide(
      {@required this.imageUrl,
      @required this.title,
      @required this.description});
}

final slideList= [
Slide(
  imageUrl: 'assets/images/6.png',
  title: 'Welcome To Top News',
  description: 'Get the latest news at your finger tips.'
 ),
Slide(
  imageUrl: 'assets/images/7.png',
  title: 'BE UPDATED',
  description: 'Read the latest news anywhere,anyplace and at anytime.'
 ),
Slide(
  imageUrl: 'assets/images/8.png',
  title: 'BE INFORMED',
  description: 'Be informed about the latest happening around the world.'
 ),
];