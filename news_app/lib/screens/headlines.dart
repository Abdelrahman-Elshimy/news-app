import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/shared-drawer.dart';

import 'home_tabs/favourite.dart';
import 'home_tabs/popular.dart';

class HeadLinesPage extends StatefulWidget {
  @override
  _HeadLinesPageState createState() => _HeadLinesPageState();
}

class _HeadLinesPageState extends State<HeadLinesPage> with TickerProviderStateMixin {

   TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('HeadLine News'),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelPadding: EdgeInsets.only(bottom: 10, top: 10),
          tabs: <Widget>[
            Text('WHAT\'S NEW'),
            Text('POPULAR'),
            Text('FAVOURITES'),
          ],
          controller: _tabController,
        ),
      ),
      drawer: SharedDrawer(),
      body: TabBarView(
        children: <Widget>[
          Favourite(),
          Popular(),
          Favourite()
        ],
        controller: _tabController,
      ),
    );
  }
}