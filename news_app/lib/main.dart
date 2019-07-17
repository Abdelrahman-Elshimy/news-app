import 'package:flutter/material.dart';
import 'package:news_app/screens/onboarding.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/util/utilies.dart';


main() async{
  bool _seen = await checkSeenStatus();
  Widget _home = OnBoarding();
  if(_seen) {
    _home = HomePage();
  }
  updateStatus();
  runApp(NewsApp(_home));
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
    );
  }


}
