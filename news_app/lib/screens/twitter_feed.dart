import 'package:flutter/material.dart';
import 'package:news_app/api/twitter_feed_data.dart';
import 'package:news_app/models/twitter_feed_model.dart';
import 'package:news_app/shared_ui/shared-drawer.dart';
import 'package:news_app/util/colors_news.dart';
import 'package:news_app/util/shared_styles.dart';

class TwitterFeedPage extends StatefulWidget {
  @override
  _TwitterFeedPageState createState() => _TwitterFeedPageState();
}

class _TwitterFeedPageState extends State<TwitterFeedPage> {
  TwitterFeedsData twitter= TwitterFeedsData();

  SharedStyles sharedStyles = new SharedStyles();
  List<TwitterFeedsModel> twittsList = [];
  @override
  void initState() {
    super.initState();
    twittsList = twitter.getTwitterData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Twitter Feeds'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: SharedDrawer(),
      body: Container(
        padding: EdgeInsets.only(top: 10,bottom: 10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: ExactAssetImage(twittsList[index].image),
                              fit: BoxFit.cover),
                        ),
                      ),
                      title: Row(
                        children: <Widget>[
                          Text(
                            twittsList[index].name,
                            style: sharedStyles.titleStoryStyle,
                          ),
                          Text(
                            '@ ${twittsList[index].username}',
                            style: sharedStyles.subtitleStoryStyle,
                          )
                        ],
                      ),
                      subtitle: Text(
                        twittsList[index].date,
                        style: sharedStyles.subtitleStoryStyle,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        twittsList[index].description,
                        style: sharedStyles.descStyle,
                      ),
                    ),
                    Divider(),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.repeat),
                                  color: NewsColors().belowColor,
                                ),
                                Transform.translate(
                                  offset: Offset(-10, 0),
                                  child: Text(twittsList[index].shareCount.toString(), style: SharedStyles().subtitleStoryStyle,),
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'SHARE',
                              style: TextStyle(
                                color: NewsColors().belowColor,
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              'OPEN',
                              style: TextStyle(
                                color: NewsColors().belowColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: twitter.getTwitterData().length,
        ),
      ),
    );
  }
}
