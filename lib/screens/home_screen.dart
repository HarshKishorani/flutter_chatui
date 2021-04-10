import 'package:chat_ui/widgets/category_selector.dart';
import 'package:chat_ui/widgets/favorite_contacts.dart';
import 'package:chat_ui/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu), 
          onPressed: () {},
          iconSize: 30,
          color: Colors.white,),
        title: Text(
          'Chats',
          style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold)
          ),
          elevation: 0,
          actions: [
          IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          iconSize: 30,
          color: Colors.white,
          ),
          ],
      ),
      // Main body of the home app
      body: Column(
        children: [
          CategorySelector(),
          //Curved White Container on home page
          Expanded(
            child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0)),
              ),
              child: Column(
                children: [
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

