import 'package:flutter/material.dart';
import 'package:news_app/screens/onboarding.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/util/utilies.dart';
import 'package:news_app/util/app-theme.dart';
import 'package:splashscreen/splashscreen.dart';




main() async{
  bool _seen = await checkSeenStatus();
  Widget _home = OnBoarding();
  if(_seen) {
    _home = HomePage();
  }
  updateStatus();
  runApp(MyApp(_home));
}

class MyApp extends StatefulWidget {
  final Widget _home;
  MyApp(this._home);
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new NewsApp(widget._home),
        imageBackground: AssetImage('assets/images/sp.jpg'),
        loaderColor: Colors.transparent,
      ),
    );
  }
}

class NewsApp extends StatefulWidget {
  final Widget _home;
  NewsApp(this._home);
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  bool seen = false;

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: widget._home,
      theme: AppTheme.themeData,
    );
  }


}

