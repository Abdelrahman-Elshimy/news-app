import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/util/shared_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  SharedStyles sharedStyles = new SharedStyles();
  PostsApi postsAPI = new PostsApi();

  Widget _timeIcon() {
    return Icon(
      Icons.timer,
      size: 18,
      color: Color.fromRGBO(117, 117, 117, 1),
    );
  }

  // get difference time
  String _parseHumanDateTime(String dateTime) {
    Duration timeAgo = DateTime.now().difference(DateTime.parse(dateTime));
    DateTime theDif = DateTime.now().subtract(timeAgo);
    return timeago.format(theDif);
  }

  Widget _popularStories(Post post) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  post.featuredImage,
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 90,
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  post.title,
                                  style: sharedStyles.titleStoryStyle,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        'Mickel Adams',
                                        style: sharedStyles.subtitleStoryStyle,
                                      ),
                                    ),
                                    _timeIcon(),
                                    Text(
                                      _parseHumanDateTime(post.dateWritten),
                                      style: sharedStyles.subtitleStoryStyle,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      // child: ListView(
      //   children: [
      //     _popularStories(),
      //     ],
      // ),

      child: FutureBuilder(
        future: postsAPI.fetchPopular(),
        builder: (context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.waiting:
              // make dummy shape until real data come.
              // return getAllSumyShapTopStories();
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
              // make dummy shape until real data come.
              // return getAllSumyShapTopStories();
               return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.none:
              return _noConnection();
              break;
            case ConnectionState.done:
              if (snapShot.error != null) {
                return _error();
              } else {
                List posts = snapShot.data;
                if (posts.length > 0) {
                  if (snapShot.hasData) {
                    return ListView.builder(
                      itemBuilder: (content, index) {
                        return _popularStories(snapShot.data[index]);
                      },
                      itemCount: posts.length,
                    );
                  } else {
                    return _noData();
                  }
                } else {
                  return _noData();
                }
              }

              break;
          }
          return null;
        },
      ),
    );
  }
}
Widget _noConnection() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    child: Text(
      'Whoops , Connection error !!!!!',
      textAlign: TextAlign.center,
    ),
  );
}

Widget _error() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    child: Text(
      'Whoops , Something error !!',
      textAlign: TextAlign.center,
    ),
  );
}

Widget _noData() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    child: Text(
      'Whoops , No Data Available',
      textAlign: TextAlign.center,
    ),
  );
}