import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
Future<bool> checkSeenStatus() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool seen = pref.getBool('seen');
  if(seen == null) {
    seen = false;
  }
  return seen;
}

void updateStatus() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setBool('seen', true);
}


Widget noConnection() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    child: Text(
      'Whoops , Connection error !!!!!',
      textAlign: TextAlign.center,
    ),
  );
}

Widget error() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    child: Text(
      'Whoops , Something error !!',
      textAlign: TextAlign.center,
    ),
  );
}

Widget noData() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    child: Text(
      'Whoops , No Data Available',
      textAlign: TextAlign.center,
    ),
  );
}
