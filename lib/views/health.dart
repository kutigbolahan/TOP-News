import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:nigeriannews/model/articles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nigeriannews/views/hompage.dart';
import 'package:nigeriannews/views/themestate.dart';

import 'package:nigeriannews/viewsmodel/news.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class Health extends StatefulWidget {
  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
int _currentindex =1;
  
  Future<News> healthnews;
  @override
  void initState() {
    
    healthnews = HttpService.getHealthNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.flare,
          color: Colors.red,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Top News',
            style: GoogleFonts.cherrySwash(
              textStyle: TextStyle(color: Colors.red),
            ),
          ),
        ),
        actions: <Widget>[
          Switch(
              //activeColor: Colors.red,
              value: Provider.of<ThemeState>(context).theme == ThemeType.DARK,
             onChanged: (value){
               Provider.of<ThemeState>(context).theme= value?ThemeType.DARK :ThemeType.LIGHT;
               setState(() {
                 
               });
             }
             )
        ],
      ),
      body: FutureBuilder<News>(
          future: healthnews,
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
                          child: Image.network(
                            snapshot.data.articles[index].urlToImage,
                            fit: BoxFit.contain,
                          )),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('Author: ${snapshot.data.articles[index].author ?? 0 } '),
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
        currentIndex: _currentindex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
               icon: IconButton(
                icon: Icon(Icons.directions_run),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                },
              ),
              title: Text('Sports'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.healing),
              title: Text('Health'),
            ),
            
          ],
          onTap: (index){
           
            setState(() {
              _currentindex = index;
            });
          },
          ),
    );
  }
}
