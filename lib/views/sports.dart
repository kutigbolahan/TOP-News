import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nigeriannews/model/articles.dart';
import 'package:nigeriannews/views/health.dart';

import 'package:nigeriannews/viewsmodel/news.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class Sports extends StatefulWidget {
  @override
  _SportsState createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    final sportsnews =
        Provider.of<HttpService>(context, listen: false).getSportsNews();
    return Scaffold(
      
      appBar: AppBar(
        
        elevation: 0.0,
        
       leading: Padding(
         padding: const EdgeInsets.all(8.0),
         child: CircleAvatar(
           backgroundImage:AssetImage('assets/images/news.png'),
         ),
       ) ,  
        title: Center(child: Text('Sports News'),
        
        ),
        
      ),
      body: FutureBuilder<News>(
        future: sportsnews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Colors.black,
                child: Center(
                  child: SpinKitCubeGrid(
                    color: Colors.white,
                    size: 150,
                  ),
                ));
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    leading: Container(
                        width: 70,
                        height: 70,
                        child: snapshot.data.articles[index].urlToImage != null
                            ? CachedNetworkImage(
                                imageUrl:
                                    snapshot.data.articles[index].urlToImage,
                                fit: BoxFit.contain,
                                placeholder: (context, url) => Container(),
                              )
                            : Container(
                                child: Center(
                                child: SpinKitFadingCircle(
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ))),
                    title: Text(snapshot.data.articles[index].title),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                              'Author: ${snapshot.data.articles[index].author ?? 0} '),
                          IconButton(
                              icon: Icon(Icons.launch),
                              onPressed: () async {
                                final url =
                                    '${snapshot.data.articles[index].url}';
                                if (await canLaunch(url)) {
                                  launch(url);
                                } else {
                                  throw 'cant launch url';
                                }
                              })
                        ],
                      )
                    ],
                  );
                });
          }
          return Container();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
      
        // unselectedItemColor: Colors.grey,
        // selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            title: Text('Sports'),
              icon: IconButton(
                  icon: Icon(Icons.directions_run),
                  onPressed: () {
                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Sports()), (route) => false) ;
                  })
          ),
          BottomNavigationBarItem(
              title: Text('Health'),
              icon: IconButton(
                  icon: Icon(Icons.healing),
                  onPressed: () {
                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Health()), (route) => false) ;
                  })),
        ],
        onTap: (index) {
          if (index==0) {
            Provider.of<HttpService>(context,listen: false).getSportsNews();
          }else{
             Provider.of<HttpService>(context,listen: false).getHealthNews();
          }
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
