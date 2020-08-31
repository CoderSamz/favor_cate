import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:favor_cate/core/model/meal_modal.dart';
import 'package:favor_cate/core/viewmodel/favor_view_model.dart';

class HYDetailFloatingButton extends StatelessWidget {

  final HYMealModel _meal;

  HYDetailFloatingButton(this._meal);

  @override
  Widget build(BuildContext context) {
    return Consumer<HYFavorViewModel>(
      builder: (ctx, favordVM, child){

        final iconData = favordVM.isFavor(_meal) ? Icons.favorite: Icons.favorite_border;
        final iconColor = favordVM.isFavor(_meal) ? Colors.red: Colors.black;

        return FloatingActionButton(
          child: Icon(iconData, color: iconColor,),
          onPressed: () {

            favordVM.handleMeal(_meal);
          },
        );
      },
    );
  }
}
