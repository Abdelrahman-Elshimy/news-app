import 'package:flutter/material.dart';
import '../../models/stories.dart';
import '../../api/stories.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  List<Stories> stories = StoriesApi().listStories();


  TextStyle _mainTitleStyle = TextStyle(
    color: Colors.black.withOpacity(.6),
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
  );

  TextStyle _titleStoryStyle = TextStyle(
    color: Colors.black.withOpacity(.7),
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
  );

  TextStyle _subtitleStoryStyle = TextStyle(
    color: Color.fromRGBO(117, 117, 117, 1),
    fontSize: 13,
    letterSpacing: 1.1,
  );

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
        style: _mainTitleStyle,
      ),
    );
  }

  List<Widget> _recentStories() {
    List<Widget> recentStroies = [];
    for (int x = 3; x < stories.length; x++) {
      recentStroies.add(
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(stories[x].image),
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
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 3, bottom: 3),
                        margin: EdgeInsets.only(bottom: 7),
                        decoration: BoxDecoration(
                          color: (stories[x].kind == 'sports')
                              ? Color.fromRGBO(255, 87, 34, 1)
                              : Color.fromRGBO(175, 180, 43, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: (stories[x].kind == 'sports')
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
                        stories[x].title,
                        style: _mainTitleStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _timeIcon(),
                        Text(
                          stories[x].time,
                          style: _subtitleStoryStyle,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return recentStroies;
  }

  List<Widget> _topStoried(int count) {
    List<Widget> topStroies = [];
    for (int i = 0; i < count; i++) {
      topStroies.add(
        Container(
          width: double.infinity,
          // padding: EdgeInsets.all(10),
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
                                  image: ExactAssetImage(
                                    stories[i].image,
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
                                    stories[i].title,
                                    style: _titleStoryStyle,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          stories[i].author,
                                          style: _subtitleStoryStyle,
                                        ),
                                      ),
                                      _timeIcon(),
                                      Text(
                                        stories[i].time,
                                        style: _subtitleStoryStyle,
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
              (i < 2) ? Divider() : Text(''),
             
            ],
          ),
        ),
      );
    }
    return topStroies;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 50, right: 50),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .3,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.8),
            image: DecorationImage(
                image: ExactAssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'How Terriers & Royals Gatechrashed Final.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'There is no one who loves pain itself, who seeks after it and wants to have it.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
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
                  padding: EdgeInsets.only(top: 10, bottom: 0),
                  child: Column(
                    children: _topStoried(3),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: _mainTitles('Update Recent'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _recentStories(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
