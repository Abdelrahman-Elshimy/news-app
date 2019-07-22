import 'package:flutter/material.dart';

class SharedDrawer extends StatefulWidget {
  @override
  _SharedDrawerState createState() => _SharedDrawerState();
}

class _SharedDrawerState extends State<SharedDrawer> {

  List<String> navs = [
    'Explore',
    'Headine News',
    'Read Later',
    'Videos',
    'Photos',
    'Settings',
    'Log Out'
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: MediaQuery.of(context).size.height * .18),
        child: ListView.builder(itemBuilder: (context, index){
          return ListTile(
            title: Text(navs[index], style: TextStyle(color: Colors.black.withOpacity(.6), fontSize: 20),),
            trailing: Icon(Icons.chevron_right, size: 30,),
          );
        }, itemCount: navs.length,),
      ),
    );
  }
}