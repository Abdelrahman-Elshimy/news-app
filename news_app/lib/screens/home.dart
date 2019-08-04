import 'package:flutter/material.dart';
import 'package:news_app/api/authors_api.dart';
import 'package:news_app/api/categories_api.dart';
import 'package:news_app/api/posts_api.dart';
import '../shared_ui/shared-drawer.dart';
import '../screens/home_tabs/whats-new.dart';
import '../screens/home_tabs/popular.dart';
import '../screens/home_tabs/favourite.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum popUpMenu { ABOUT, HELP, CONTACT, SETTINGS }

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  AuthorAPI authorApi = new AuthorAPI();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    authorApi.fetchAllAuthor();
    CategoriesApi().fetchAllCategory();
    PostsApi().fetchWhatsNews();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Explore'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<popUpMenu>(
                  value: popUpMenu.ABOUT,
                  child: Text('ABOUT'),
                ),
                PopupMenuItem<popUpMenu>(
                  value: popUpMenu.HELP,
                  child: Text('HELP'),
                ),
                PopupMenuItem<popUpMenu>(
                  value: popUpMenu.CONTACT,
                  child: Text('CONTACT'),
                ),
                PopupMenuItem<popUpMenu>(
                  value: popUpMenu.SETTINGS,
                  child: Text('SETTINGS'),
                ),
              ];
            },
            onSelected: (popUpMenu menu) {
            },
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
        children: <Widget>[WhatsNew(), Popular(), Favourite()],
        controller: _tabController,
      ),
    );
  }
}
