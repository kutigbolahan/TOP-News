import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nigeriannews/model/articles.dart';
import 'package:nigeriannews/views/health.dart';
import 'package:nigeriannews/views/sports.dart';
import 'package:nigeriannews/views/tech.dart';
import 'package:nigeriannews/views/themestate.dart';
import 'package:nigeriannews/viewsmodel/news.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Entertainment extends StatefulWidget {
  Entertainment({Key key}) : super(key: key);

  @override
  _EntertainmentState createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  int _currentIndex;
  Future<News> entertainnews;

  @override
  void initState() {
    entertainnews = HttpService.getEntertainmentNews();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
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
          future: entertainnews,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
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
                                  imageUrl:
                                      snapshot.data.articles[index].urlToImage,
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                )
                              : Container()),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Flexible(
                              flex: 5,
                              child: Text(
                                'Author: ${snapshot.data.articles[index].author ?? 0} ',
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                              ),
                            ),
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
              }
              return CircularProgressIndicator();
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.directions_run),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SportsPage()));
              },
            ),
            title: Text(
              'Sports',
              style: GoogleFonts.cherrySwash(),
            ),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.healing),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Health()));
              },
            ),
            title: Text('Health',style: GoogleFonts.cherrySwash()),
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.disc_full),
            title: Text('Entertainment',style: GoogleFonts.cherrySwash()),
          
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.computer),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TechPage()));
              },
            ),
            title: Text('Tech', style: GoogleFonts.cherrySwash()),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}