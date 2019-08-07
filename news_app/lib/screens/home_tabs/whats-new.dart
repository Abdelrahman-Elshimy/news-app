import 'package:flutter/material.dart';
import 'package:news_app/screens/single_page.dart';
import 'package:news_app/util/colors_news.dart';
import '../../models/post.dart';
import '../../api/posts_api.dart';
import '../../util/shared_styles.dart';
import 'package:news_app/util/utilies.dart';
import 'dart:math';
import 'package:timeago/timeago.dart' as timeago;

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  initState() {
    super.initState();
  }

  List<Post> posts = [];
  PostsApi postsApi = new PostsApi();

  // List<Stories> stories = StoriesApi().listStories();

  SharedStyles sharedStyles = new SharedStyles();

  Widget _timeIcon() {
    return Icon(
      Icons.timer,
      size: 18,
      color: Color.fromRGBO(117, 117, 117, 1),
    );
  }

  Widget _mainTitles(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: sharedStyles.mainTitleStyle,
      ),
    );
  }

  Widget getDumyRand() {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .3,
      color: NewsColors().dummy,
    );
  }

  // dumy shape of recent updates
  Widget _dumyShapRecentUpdates() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            color: NewsColors().dummy,
            margin: EdgeInsets.only(bottom: 20),
          ),
          Container(
            height: 20,
            color: NewsColors().dummy,
            margin: EdgeInsets.only(bottom: 20),
          ),
          Container(
            height: 20,
            color: NewsColors().dummy,
            margin: EdgeInsets.only(bottom: 20),
          ),
          Container(
            height: 20,
            color: NewsColors().dummy,
            margin: EdgeInsets.only(bottom: 20),
          ),
        ],
      ),
    );
  }

  // recent update widget
  Widget _recentStories(Post post) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(post.featuredImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 3),
                    margin: EdgeInsets.only(bottom: 7),
                    decoration: BoxDecoration(
                      color: ('sports' == 'sports')
                          ? Color.fromRGBO(255, 87, 34, 1)
                          : Color.fromRGBO(175, 180, 43, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ('sports' == 'sports')
                        ? Text(
                            'SPORTS',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          )
                        : Text(
                            'LIFE STYLE',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          )),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    post.title,
                    style: sharedStyles.mainTitleStyle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _timeIcon(),
                    Text(
                      _parseHumanDateTime(post.dateWritten),
                      style: sharedStyles.subtitleStoryStyle,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // get difference time
  String _parseHumanDateTime(String dateTime) {
    Duration timeAgo = DateTime.now().difference(DateTime.parse(dateTime));
    DateTime theDif = DateTime.now().subtract(timeAgo);
    return timeago.format(theDif);
  }

  // top story widget
  Widget _topStoried(Post post) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
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
    );
  }

  // dumy shape of top stories
  Widget _dumyShapTopStories() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 90,
                    color: NewsColors().dummy,
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
                          child: Container(
                            color: NewsColors().dummy,
                            height: 40,
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  color: NewsColors().dummy,
                                  height: 20,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 20,
                                  color: NewsColors().dummy,
                                ),
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
          ),
        ],
      ),
    );
  }

  // make dunmy shape list
  Widget getAllSumyShapTopStories() {
    return Column(
      children: <Widget>[
        _dumyShapTopStories(),
        Divider(),
        _dumyShapTopStories(),
        Divider(),
        _dumyShapTopStories()
      ],
    );
  }

  // Get Random Top Stories
  Widget _getRandTopStories() {
    return FutureBuilder(
      future: postsApi.fetchWhatsNews(),
      builder: (context, AsyncSnapshot snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.waiting:
            // make dummy shape until real data come.
            return getDumyRand();
            break;
          case ConnectionState.active:
            // make dummy shape until real data come.
            return getDumyRand();
            break;
          case ConnectionState.none:
            return noConnection();
            break;
          case ConnectionState.done:
            if (snapShot.error != null) {
              return error();
            } else {
              List posts = snapShot.data;
              if (posts.length > 0) {
                if (snapShot.hasData) {
                  List<Post> posts = snapShot.data;
                  Random random = new Random();
                  int ind = random.nextInt(posts.length);
                  Post post = posts[ind];
                  print(post.featuredImage);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SinglePostPage(post);
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(post.featuredImage.toString()),
                            fit: BoxFit.cover),
                        color: NewsColors().dummy,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            post.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            post.content.substring(1, 70) + '.....',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _getRandTopStories(),
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: _mainTitles('Top Stories'),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: FutureBuilder(
                    future: postsApi.fetchWhatsNews(),
                    builder: (context, AsyncSnapshot<List<Post>> snapShot) {
                      switch (snapShot.connectionState) {
                        case ConnectionState.waiting:
                          // make dummy shape until real data come.
                          return getAllSumyShapTopStories();
                          break;
                        case ConnectionState.active:
                          // make dummy shape until real data come.
                          return getAllSumyShapTopStories();
                          break;
                        case ConnectionState.none:
                          return noConnection();
                          break;
                        case ConnectionState.done:
                          if (snapShot.error != null) {
                            return error();
                          } else {
                            List posts = snapShot.data;
                            if (posts.length >= 3) {
                              if (snapShot.hasData) {
                                Post post = snapShot.data[0];
                                Post post1 = snapShot.data[1];
                                Post post2 = snapShot.data[3];
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SinglePostPage(post);
                                        }));
                                      },
                                      child: _topStoried(post),
                                    ),
                                    Divider(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SinglePostPage(post1);
                                        }));
                                      },
                                      child: _topStoried(post1),
                                    ),
                                    Divider(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SinglePostPage(post2);
                                        }));
                                      },
                                      child: _topStoried(post2),
                                    ),
                                  ],
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
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: _mainTitles('Update Recent'),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: FutureBuilder(
                  future: postsApi.fetchRecentUpdatesNews(),
                  builder: (context, AsyncSnapshot<List<Post>> snapShot) {
                    switch (snapShot.connectionState) {
                      case ConnectionState.waiting:
                        // make dummy shape until real data come.
                        return _dumyShapRecentUpdates();
                        break;
                      case ConnectionState.active:
                        // make dummy shape until real data come.
                        return _dumyShapRecentUpdates();
                        break;
                      case ConnectionState.none:
                        return noConnection();
                        break;
                      case ConnectionState.done:
                        if (snapShot.error != null) {
                          return error();
                        } else {
                          List posts = snapShot.data;
                          if (posts.length >= 2) {
                            if (snapShot.hasData) {
                              Post post = snapShot.data[0];
                              Post post1 = snapShot.data[1];
                              return Column(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SinglePostPage(post);
                                        }));
                                      },
                                      child: _recentStories(post),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SinglePostPage(post1);
                                        }));
                                      },
                                      child: _recentStories(post1),
                                    ),
                                ],
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
