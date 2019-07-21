import 'package:flutter/material.dart';
import '../../models/stories.dart';
import '../../api/stories.dart';
import 'dart:math';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Stories> stories = StoriesApi().listStories();

  List<Color> catColors =[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amberAccent,
    Colors.cyanAccent,
  ];

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      return favoriteStory(index);
    } , itemCount: stories.length,);
  }
  Random random = Random();
  Color _getRandomColor() {
    return catColors[random.nextInt(catColors.length)];
  }

  Widget favoriteStory(int index) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    image: AssetImage(stories[index].image),
                    fit: BoxFit.cover),
              ),
            ),
            title: Text(
              stories[index].author,
              style: _subtitleStoryStyle,
            ),
            subtitle: Row(
              children: <Widget>[
                Text(stories[index].time),
                SizedBox(
                  width: 5,
                ),
                Text(
                  stories[index].kind,
                  style:
                      TextStyle(color: _getRandomColor(), fontWeight: FontWeight.bold),
                )
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.bookmark_border),
              onPressed: () {},
              color: Colors.black54,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10 , right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    child: Image.asset(
                      stories[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),

                    child: Column(
                    
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          stories[index].title,
                          style: _titleStoryStyle,
                        ),
                        SizedBox(height: 15,),
                        Text(
                          stories[index].description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            height: 1.3,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
