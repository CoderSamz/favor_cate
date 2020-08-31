import 'package:favor_cate/core/viewmodel/favor_view_model.dart';
import 'package:favor_cate/ui/pages/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:favor_cate/core/model/meal_modal.dart';
import 'package:favor_cate/core/extension/int_extension.dart';
import 'package:provider/provider.dart';
import 'operation_item.dart';

final cardRadius = 12.px;

class HYMealItem extends StatelessWidget {
  final HYMealModel _meal;
  HYMealItem(this._meal);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
        child: Column(
          children: <Widget>[
            buildBasicInfo(context),
            buildOperationInfo(),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(HYDetailScreen.routeName, arguments: _meal);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cardRadius),
            topRight: Radius.circular(cardRadius),
          ),
          child: Image.network(_meal.imageUrl,width: double.infinity,height: 250.px,fit: BoxFit.cover,)
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300.px,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6.px)
            ),
            child: Text(_meal.title,style: Theme.of(context).textTheme.headline2.copyWith(
              color: Colors.white,
            ),),
          ),
        )
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(5.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HYOperationItem(Icon(Icons.schedule), "${_meal.duration} 分钟"),
          HYOperationItem(Icon(Icons.restaurant), "${_meal.complexStr}"),
          buildFavorItem(),
        ],
      ),
    );
  }

  Widget buildFavorItem() {
    return Consumer<HYFavorViewModel>(
      builder: (ctx, favorVM, child) {
        final iconData = favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
        final favorColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;
        final title = favorVM.isFavor(_meal) ? "收藏" : "未收藏";

        return GestureDetector(
          child: HYOperationItem(
            Icon(iconData, color: favorColor,),
            title,
            textColor: favorColor,
          ),
          onTap: () {
            favorVM.handleMeal(_meal);
          },
        );
      }
    );
  }
}
