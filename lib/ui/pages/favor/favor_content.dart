import 'package:favor_cate/core/viewmodel/favor_view_model.dart';
import 'package:favor_cate/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HYFavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HYFavorViewModel>(
        builder: (ctx, favorVM, child) {

          if (favorVM.meals.length == 0) {
            return Center(
              child: Text("未收藏美食"),
            );
          }

          return ListView.builder(
            itemCount: favorVM.meals.length,
            itemBuilder: (ctx, index) {
              return HYMealItem(favorVM.meals[index]);
            }
          );
        }
    );
  }
}
