import 'package:flutter/material.dart';
import '../shared_ui/shared-drawer.dart';
import '../screens/home_tabs/whats-new.dart';
import '../screens/home_tabs/popular.dart';
import '../screens/home_tabs/favourite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  
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
        title: Text('Explore'),
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
          WhatsNew(),
          Popular(),
          Favourite()
        ],
        controller: _tabController,
      ),
    );
  }
}