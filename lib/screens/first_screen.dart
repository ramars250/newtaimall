import 'package:flutter/material.dart';

import '../widgets/topnavigator.dart';
import '../screens/banner_screen.dart';
import '../widgets/app_drawer.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaiMall'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('test'),
              )
            ],
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BannerScreen(),
          TopNavigator(),
        ],
      ),
    );
  }
}
