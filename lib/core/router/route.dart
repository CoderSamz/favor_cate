import 'package:favor_cate/ui/pages/filter/filter_content.dart';
import 'package:favor_cate/ui/pages/filter/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:favor_cate/ui/pages/detail/detail_page.dart';
import 'package:favor_cate/ui/pages/main/main_page.dart';
import 'package:favor_cate/ui/pages/meal/meal_page.dart';

class HYRouter {
  static final Map<String, WidgetBuilder> routers = {
    HYMainScreen.routeName: (ctx) => HYMainScreen(),
    HYMealScreen.routeName: (ctx) => HYMealScreen(),
    HYDetailScreen.routeName: (ctx) => HYDetailScreen()
  };

  static final String initialRoute = HYMainScreen.routeName;

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == HYFilterScreen.routeName) {
      return MaterialPageRoute(
        builder: (ctx) {
          return HYFilterScreen();
        },
        fullscreenDialog: true
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}