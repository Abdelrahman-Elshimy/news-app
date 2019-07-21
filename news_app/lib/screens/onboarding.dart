import 'package:flutter/material.dart';
import 'package:news_app/screens/home.dart';
import '../models/walkthriugh.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<WalkThrough> welcomeStats = [
    WalkThrough('Welcome!', 'assets/images/pricing.png',
        'Making friends is easy as waving your hand back and forth in easy step.'),
    WalkThrough('Stand Up!!', 'assets/images/vergulde-draak-web.jpg',
        'Making friends is easy as waving your hand back and forth in easy step.'),
    WalkThrough('See Needs!', 'assets/images/trial-web.jpg',
        'Making friends is easy as waving your hand back and forth in easy step.'),
    WalkThrough('We Glad!', 'assets/images/zuiddorp-web.jpg',
        'Making friends is easy as waving your hand back and forth in easy step.'),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("${welcomeStats[index].image}"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.gesture,
                        size: 80,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${welcomeStats[index].title}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 3,
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${welcomeStats[index].description}',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Colors.grey, letterSpacing: 1.3),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: welcomeStats.length,
          ),
          Positioned(
            bottom: 10,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, letterSpacing: 2),
                ),
                color: Colors.red,
                textColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            child: Transform.translate(
              offset: Offset(0, 110),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _listWidgetsIndicators(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _listWidgetsIndicators() {
    List<Widget> widgets = [];
    for(var i in welcomeStats) {
      widgets.add(_circulindicator(Colors.grey, 7));
      print(i);
    }

    for(int i = 0; i < welcomeStats.length; i++) {
      for(int x =0; x < welcomeStats.length; x++) {
        if(currentIndex == x) {
          widgets[currentIndex] = _circulindicator(Colors.red, 9);
        }
        
      }
    }
    return widgets;
  }

  dynamic _circulindicator(Color color, double size) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
