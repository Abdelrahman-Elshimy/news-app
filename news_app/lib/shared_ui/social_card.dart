import 'package:flutter/material.dart';
import 'package:news_app/util/colors_news.dart';
import 'package:news_app/util/shared_styles.dart';
class SocialCard extends StatefulWidget {
  @override
  _SocialCardState createState() => _SocialCardState();
}

class _SocialCardState extends State<SocialCard> {
    SharedStyles sharedStyles = new SharedStyles();

  @override
  Widget build(BuildContext context) {
    return _facebookFeeds();
  }

  Widget _facebookFeeds() {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              'Christina Meyers',
              style: sharedStyles.mainTitleStyle,
            ),
            subtitle: Text(
              'Fri, 12 May 2017 • 14.30',
              style: sharedStyles.subtitleStoryStyle,
            ),
            trailing: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Transform.translate(
                      offset: Offset(-10, 0),
                      child: Text(
                        '25',
                        style: sharedStyles.subtitleStoryStyle,
                      )),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Text(
              'We also talk about the future of work as the robots',
              style: sharedStyles.descStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
            child: Text(
              '#advance #retro #instagram',
              style: TextStyle(
                color: NewsColors().belowColor,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('10 COMMENTS', style: TextStyle(
                    color: NewsColors().belowColor,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('SHARE', style: TextStyle(
                    color: NewsColors().belowColor,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('OPEN', style: TextStyle(
                    color: NewsColors().belowColor,
                    fontWeight: FontWeight.w600,
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}