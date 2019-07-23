import 'package:flutter/material.dart';

class SharedStyles {
  TextStyle mainTitleStyle = TextStyle(
    color: Colors.black.withOpacity(.6),
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
  );

  TextStyle titleStoryStyle = TextStyle(
    color: Colors.black.withOpacity(.7),
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
  );

  TextStyle subtitleStoryStyle = TextStyle(
    color: Color.fromRGBO(117, 117, 117, 1),
    fontSize: 13,
    letterSpacing: 1.1,
  );

  TextStyle descStyle = TextStyle(
    fontSize: 15,
    color: Colors.black.withOpacity(.6),
    height: 1.3,
    letterSpacing: 1.2,
  );
}
