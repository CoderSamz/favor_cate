import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../favor/favor_page.dart';

final List<Widget> pages = [
  HYHomeScreen(),
  HYFavorScreen()
];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    title: Text("首页"),
    icon: Icon(Icons.home)
  ),
  BottomNavigationBarItem(
      title: Text("收藏"),
      icon: Icon(Icons.star)
  ),
];