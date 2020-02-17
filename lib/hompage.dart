import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nigeriannews/articles.dart';
import 'package:nigeriannews/news.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading;
  var newsList;

  void getnews() async {
    News news = News();
    await news.getNews();
    setState(() {
      isLoading = false;
      newsList = news.news;
    });
  }

  @override
  void initState() {
    isLoading = true;
    super.initState();
    getnews();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          'TopNews',
          style: TextStyle(color: Colors.black),
        )),
      ),
       body:
      SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: <Widget>[
                     
                      Expanded(
                        child: ListView.builder(
                          itemCount: newsList.length,
                          itemBuilder: (context, index) {
                            return ExpansionTile(
                              title: Text(newsList[index].title),
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                         
                                          IconButton(
                                              icon: Icon(Icons.launch),
                                              onPressed: () async{
                                                final fakeurl =
                                                    "${newsList[index].url}";
                                                if (await canLaunch(fakeurl)) {
                                                  launch(fakeurl);
                                                }else{
                                                  throw 'could not launch url';
                                                }
                                                
                                              })
                                          // Text( newsList[index].url)
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],

                              // subtitle: Text(
                              //  newsList[index].url
                              // ),
                              leading:
                                  Container(
                                    width: 70,
                                    height: 70,
                                    child: Image.network(newsList[index].urlToImage,
                                    fit: BoxFit.contain,
                                    ),
                                  ),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
      ),
      bottomNavigationBar: CupertinoTabBar( 
        
        backgroundColor: Colors.black,
        activeColor: Colors.white,
         items:  [
      BottomNavigationBarItem(
        icon: Icon(Icons.event_note),
        title: Text('Naija news')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.extension),
        title: Text('Foreign news')
      ),
      ]),
    );
  }
}
