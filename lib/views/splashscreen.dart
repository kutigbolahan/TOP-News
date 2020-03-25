import 'dart:async';

import 'package:flutter/material.dart';

import 'package:nigeriannews/model/slidemodel.dart';

import 'package:nigeriannews/widgets/slide_item.dart';
import 'package:nigeriannews/widgets/slide_dots.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5000000000000), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
    });
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                    PageView.builder(
                        scrollDirection: Axis.horizontal,
                        onPageChanged: _onPageChanged,
                        controller: _pageController,
                        itemCount: slideList.length,
                        itemBuilder: (ctx, i) => SlideItem(i)),
                        Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: <Widget>[
                          
                            Container(
                              margin: const EdgeInsets.only(bottom:35),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  for(int i =0; i<slideList.length; i++)
                                  if (i == _currentPage) 
                                    SlideDots(true)
                                  else
                                    SlideDots(false)
                                  
                                ],
                              ),
                            )
                          ],
                        )
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
