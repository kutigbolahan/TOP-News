import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:nigeriannews/model/articles.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:nigeriannews/views/entertainment.dart';
// import 'package:nigeriannews/views/health.dart';
// import 'package:nigeriannews/views/tech.dart';
import 'package:nigeriannews/views/themestate.dart';

import 'package:nigeriannews/viewsmodel/news.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SportsPage extends StatefulWidget {
  static String routeName = 'sports';
  @override
  _SportsPageState createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  int _currentindex = 0;
   //Future<News> sportsnews;
  HttpService news;
  //Future<News> news;
  bool isLoading = false;
  Article article;

  // @override
  // void initState() {
  //  // sportsnews =HttpService.getSportsNews();
  //  news = Provider.of<HttpService>(context);
  //   isLoading = false;
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
     news = Provider.of<HttpService>(context);
     isLoading = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final http = Provider.of<HttpService>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.flare,
          color: Colors.white,
        ),
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Top News',
            style: GoogleFonts.cherrySwash(
              textStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
        actions: <Widget>[
          Switch(
              activeColor: Colors.white,
              value: themeNotifier.isdarkTheme,
              onChanged: (value) {
                themeNotifier.setThemeData = value;
              })
        ],
      ),
      body: FutureBuilder<News>(
                  // future: news,

                  builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return  ListView.builder(
                      itemCount: snapshot.data.articles.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          title: Text(snapshot.data.articles[index].title,
                              style: GoogleFonts.cormorantGaramond()),
                          leading: Container(
                              width: 70,
                              height: 70,
                              child: snapshot.data.articles[index].urlToImage !=
                                      null
                                  ? CachedNetworkImage(
                                      imageUrl: snapshot
                                          .data.articles[index].urlToImage,
                                      fit: BoxFit.contain,
                                      placeholder: (context, url) => Container(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator()),
                                    )
                                  : CircularProgressIndicator()),
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                    'Author: ${snapshot.data.articles[index].author ?? 0} '),
                                IconButton(
                                  icon: Icon(
                                    Icons.launch,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    final url =
                                        '${snapshot.data.articles[index].url}';
                                    if (await canLaunch(url)) {
                                      launch(url);
                                    } else {
                                      throw 'cant launch url';
                                    }
                                  },
                                )
                              ],
                            )
                          ],
                        );
                      });
                } else {
                  if (snapshot.error) {
                    print(snapshot.error);
                    return Text('${snapshot.error}');
                  } else {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Articles loading');
                    }
                  }
                  return CircularProgressIndicator();
                }
              }),
      // isLoading != false ? FutureBuilder<News>(
      //     future: sportsnews,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return ListView.builder(
      //             itemCount: snapshot.data.articles.length,
      //             itemBuilder: (context, index) {
      //               return ExpansionTile(
      //                 title: Text(snapshot.data.articles[index].title,
      //                     style: GoogleFonts.cormorantGaramond()),
      //                 leading: Container(
      //                     width: 70,
      //                     height: 70,
      //                     child: snapshot.data.articles[index].urlToImage !=
      //                             null
      //                         ? CachedNetworkImage(
      //                             imageUrl:
      //                                 snapshot.data.articles[index].urlToImage,
      //                             fit: BoxFit.contain,
      //                             placeholder: (context, url) => Container(
      //                                 width: 20,
      //                                 height: 20,
      //                                 child: CircularProgressIndicator()),
      //                           )
      //                         : CircularProgressIndicator()),
      //                 children: <Widget>[
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: <Widget>[
      //                        Text('Author: ${snapshot.data.articles[index].author ?? 0 } '),
      //                       IconButton(
      //                         icon: Icon(
      //                           Icons.launch,
      //                           size: 20,
      //                         ),
      //                         onPressed: () async {
      //                           final url =
      //                               '${snapshot.data.articles[index].url}';
      //                           if (await canLaunch(url)) {
      //                             launch(url);
      //                           } else {
      //                             throw 'cant launch url';
      //                           }
      //                         },
      //                       )
      //                     ],
      //                   )
      //                 ],
      //               );
      //             });
      //       } else {
      //         if (snapshot.error) {
      //           print(snapshot.error);
      //           return Text('${snapshot.error}');
      //         }else {
      //           if (snapshot.connectionState == ConnectionState.waiting) {
      //             return Text('Articles loading');
      //           }
      //         }
      //         return CircularProgressIndicator();
      //       }

      //     }): CircularProgressIndicator(),
      // bottomNavigationBar: BottomNavigationBar(

      //   type: BottomNavigationBarType.shifting,
      //   currentIndex: _currentindex,
      //  // backgroundColor: Colors.black,
      //  // selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.grey,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.directions_run),
      //       title: Text('Sports',style: GoogleFonts.cherrySwash()),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         icon: Icon(Icons.healing),
      //         onPressed: () {
      //          http.getHealthNews();
      //         },
      //       ),
      //       title: Text('Health',style: GoogleFonts.cherrySwash()),
      //     ),
      //      BottomNavigationBarItem(
      //       icon: IconButton(
      //         icon:Icon(Icons.disc_full),
      //        onPressed: () {
      //           http.getEntertainmentNews();
      //         },
      //       ),
      //       title: Text('Entertainment', style: GoogleFonts.cherrySwash()),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: IconButton(
      //         icon: Icon(Icons.computer),
      //         onPressed: () {
      //           http.getTechnologyNews();
      //         },
      //       ),
      //       title: Text('Tech', style: GoogleFonts.cherrySwash()),
      //     ),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _currentindex = index;
      //     });
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.shifting,
        
        items: [
          BottomNavigationBarItem(
              title: Text('Sports'),
              icon: Icon(Icons.directions_run)
                ),
          BottomNavigationBarItem(
              title: Text('Health'),
               icon: Icon(Icons.healing)
                ),
          BottomNavigationBarItem(
              title: Text('Entertainment'),
               icon: Icon(Icons.disc_full)
                ),
          BottomNavigationBarItem(
              title: Text('Technology'),
               icon: Icon(Icons.computer)
                ),
         
        ],
        onTap: (index) {
         if (index == 0) {
           Provider.of<HttpService>(context, listen: false).getSportsNews();
           
         }else if (index == 1) {
           assert(index==1);
           Provider.of<HttpService>(context, listen: false).getHealthNews();
          
         }else if (index == 2) {
           assert(index == 2);
           Provider.of<HttpService>(context, listen: false).getEntertainmentNews();
         }else if(index == 3){
               assert(index == 3);
               Provider.of<HttpService>(context, listen: false).getTechnologyNews();
         }

         
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
