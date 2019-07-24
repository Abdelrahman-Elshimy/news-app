import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/shared-drawer.dart';
import 'package:news_app/shared_ui/social_card.dart';


class InstgramFeedPage extends StatefulWidget {
  @override
  _InstgramFeedPageState createState() => _InstgramFeedPageState();
}

class _InstgramFeedPageState extends State<InstgramFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Instgram Feeds'),
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
