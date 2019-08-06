import 'package:flutter/material.dart';
import 'package:news_app/models/post.dart';

class SinglePostPage extends StatefulWidget {
  final Post post;
  SinglePostPage(this.post);
  @override
  _SinglePostPageState createState() => _SinglePostPageState();
}

class _SinglePostPageState extends State<SinglePostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      
      body: Container(
        child: Text(widget.post.title),
        color: Colors.red,
      ),
    );
  }
}