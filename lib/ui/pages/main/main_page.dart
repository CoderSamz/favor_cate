import 'package:favor_cate/ui/pages/home/home_drawer.dart';
import 'package:flutter/material.dart';

import 'package:favor_cate/ui/pages/main/initialize_items.dart';

class HYMainScreen extends StatefulWidget {
  static const String routeName = "/";

  @override
  _HYMainScreenState createState() => _HYMainScreenState();
}

class _HYMainScreenState extends State<HYMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: HYHomeDrawer(),
    );
  }
}
