import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/screens/single_page.dart';
import 'package:news_app/util/shared_styles.dart';
import 'package:news_app/util/utilies.dart';
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

  // get popular stories
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
              return noConnection();
              break;
            case ConnectionState.done:
              if (snapShot.error != null) {
                return error();
              } else {
                List<Post> posts = snapShot.data;
                if (posts.length > 0) {
                  if (snapShot.hasData) {
                    return ListView.builder(
                      itemBuilder: (content, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SinglePostPage(posts[index]);
                            }));
                          },
                          child: _popularStories(posts[index]),
                        );
                      },
                      itemCount: posts.length,
                    );
                  } else {
                    return noData();
                  }
                } else {
                  return noData();
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
