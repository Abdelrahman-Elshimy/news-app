import 'package:flutter/material.dart';
import 'package:news_app/util/shared_styles.dart';
import '../../models/stories.dart';
import '../../api/stories.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  List<Stories> stories = StoriesApi().listStories();
  SharedStyles sharedStyles = new SharedStyles();




  Widget _timeIcon() {
    return Icon(
      Icons.timer,
      size: 18,
      color: Color.fromRGBO(117, 117, 117, 1),
    );
  }





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
                                      style: sharedStyles.titleStoryStyle,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            stories[i].author,
                                            style: sharedStyles.subtitleStoryStyle,
                                          ),
                                        ),
                                        _timeIcon(),
                                        Text(
                                          stories[i].time,
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
