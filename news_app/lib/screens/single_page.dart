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
      body: Container(
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: (){},
                    )
                  ],
                  centerTitle: true,
                  backgroundColor: Colors.red,
                  expandedHeight: MediaQuery.of(context).size.height * .3,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(widget.post.featuredImage,
                        fit: BoxFit.cover),
                    title: Container(
                      margin: EdgeInsets.only(right: 100),
                      child: Text(widget.post.title, style: TextStyle(fontSize: 16),),
                    ),

                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 1000.0,
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        height: 1000,
                        color: Colors.red,
                        child: Text('asdlkjdsjasdklj'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
