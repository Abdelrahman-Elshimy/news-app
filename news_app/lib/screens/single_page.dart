import 'package:flutter/material.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/util/shared_styles.dart';

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
                      onPressed: () {},
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
                      child: Text(
                        widget.post.title,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                // SliverList(
                //   delegate: Si,
                // ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, position) {
                    if (position == 0) {
                      return _contentOfPost();
                    } else if (position == 1) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: 10, top: 10),
                        child: Text(
                          'Comments (3)',
                          style: SharedStyles().mainTitleStyle,
                        ),
                      );
                    } else if (position >= 2 && position < 24) {
                      return _comments();
                    } else {
                      return _addComment();
                    }
                  }, childCount: 25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _addComment() {
    return Stack(
      children: <Widget>[
        Container(
          child: TextFormField(
            
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20, top: 20,bottom: 20, right: 80),
              hintText: 'Write comment here...',
              
              isDense: true,
              border: InputBorder.none,
              filled: true,
              fillColor: Color.fromRGBO(241, 245, 247, 1),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 5,
          child: RaisedButton(
            color: Colors.transparent,
            elevation: 0,
            onPressed: () {},
            child: Text(
              'SEND',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _comments() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5, right: 20),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('assets/images/1.jpg'),
                ),
                title: Text('Cherista'),
                subtitle: Text('1 hour'),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                    'Weasel the jeeper goodness inconsiderately spelled so ubiquitou'),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _contentOfPost() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
          child: Text(
            widget.post.content,
            style: SharedStyles().descStyle,
          ),
        ),
        Divider(
          color: Colors.black26,
        ),
      ],
    );
  }
}
