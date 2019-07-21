import 'package:flutter/material.dart';
import '../../models/stories.dart';
import '../../api/stories.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  List<Stories> stories = StoriesApi().listStories();



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



  TextStyle _titleStoryStyle = TextStyle(
    color: Colors.black.withOpacity(.7),
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
  );

  List<Widget> _topStoried(int count) {
    List<Widget> topStroies = [];
    for (int i = 0; i < count; i++) {
      topStroies.add(
        Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
              ],
            ),
          ),
        ),
      );
    }
    return topStroies;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView(
        children: _topStoried(stories.length),
      ),
    );
  }
}
