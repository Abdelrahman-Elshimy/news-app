import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/shared-drawer.dart';
import 'package:news_app/shared_ui/social_card.dart';

class FaceBookPage extends StatefulWidget {
  @override
  _FaceBookPageState createState() => _FaceBookPageState();
}

class _FaceBookPageState extends State<FaceBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Facebook Feeds'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: SharedDrawer(),
      body: Container(
        margin: EdgeInsets.all(6),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SocialCard();
          },
          itemCount: 4,
        ),
      ),
    );
  }

   
}