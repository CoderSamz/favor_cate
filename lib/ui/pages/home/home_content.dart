import 'package:flutter/material.dart';
import 'package:favor_cate/core/model/category_model.dart';
import 'package:favor_cate/core/services/json_parse.dart';
import 'package:favor_cate/core/extension/int_extension.dart';

import 'home_category_item.dart';

class HYHomeContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HYCategoryModel>>(
      future: HYJsonParse.getCategoryData(),
      builder: (ctx, snapshot){
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator(),);

        if (snapshot.hasError) return Center(child: Text("请求失败"),);

        final category = snapshot.data;
        return GridView.builder(
            padding: EdgeInsets.all(20.px),
            itemCount: category.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.px,
                mainAxisSpacing: 20.px,
                childAspectRatio: 1.5
            ),
            itemBuilder: (ctx, index) {
              return HYHomeCategoryItem(category[index]);
            }
        );
      },
    );
  }
}


