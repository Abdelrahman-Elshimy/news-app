import 'package:flutter/material.dart';
import 'package:news_app/screens/facebook_feeds.dart';
import 'package:news_app/screens/headlines.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/instgram_feed.dart';
import 'package:news_app/screens/twitter_feed.dart';
import '../models/nav_menu.dart';

class SharedDrawer extends StatefulWidget {
  @override
  _SharedDrawerState createState() => _SharedDrawerState();
}

class _SharedDrawerState extends State<SharedDrawer> {

  List<NavMenu> navsItems = [
    NavMenu('Explore', () => HomePage()),
    NavMenu('Head Line News', ()=> HeadLinesPage()),
    NavMenu('Twitter Feeds', ()=> TwitterFeedPage()),
    NavMenu('Instgram Feeds', ()=> InstgramFeedPage()),
    NavMenu('Face Book Feeds', () => FaceBookPage()),
  ];

  List<String> navs = [
    'Explore',
    'Headine News',
    'Read Later',
    'Videos',
    'Photos',
    'Settings',
    'Log Out'
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: MediaQuery.of(context).size.height * .18),
        child: ListView.builder(itemBuilder: (context, index){
          return ListTile(
            title: Text(navsItems[index].title, style: TextStyle(color: Colors.black.withOpacity(.6), fontSize: 18),),
            trailing: Icon(Icons.chevron_right, size: 30,),
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> navsItems[index].destination()));
            },
          );
        }, itemCount: navsItems.length,),
      ),
    );
  }
}