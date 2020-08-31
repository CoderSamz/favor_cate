import 'package:favor_cate/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:favor_cate/core/router/route.dart';
import 'package:favor_cate/ui/shared/app_theme.dart';
import 'package:favor_cate/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';
import 'package:favor_cate/core/viewmodel/favor_view_model.dart';
import 'package:favor_cate/core/viewmodel/meal_view_model.dart';

void main() {
  // Provider -> ViewModel/Provider/Consumer(Selector)

  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (ctx) => HYMealViewModel()),
        ChangeNotifierProvider(create: (ctx) => HYFilterViewModel()),
        // ChangeNotifierProvider(create: (ctx) => HYFavorViewModel()),
        // 依赖模型
        ChangeNotifierProxyProvider<HYFilterViewModel, HYMealViewModel>(
          create: (ctx) => HYMealViewModel(),
          update: (ctx, filterVM, mealVM) {
            mealVM.updateFilters(filterVM);
            return mealVM;
          },
        ),
        ChangeNotifierProxyProvider<HYFilterViewModel, HYFavorViewModel>(
          create: (ctx) => HYFavorViewModel(),
          update: (ctx, filterVM, favorVM) {
            favorVM.updateFilters(filterVM);
            return favorVM;
          },
        ),

      ],
      child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HYSizeFit.initialize();

    return MaterialApp(
      title: '美食广场',

      // 主题
      theme: HYAppTheme.norTheme,
      // 路由
      initialRoute: HYRouter.initialRoute,
      routes: HYRouter.routers,
      onGenerateRoute: HYRouter.generateRoute,
      onUnknownRoute: HYRouter.unknownRoute,
    );
  }
}

