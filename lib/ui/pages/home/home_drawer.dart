import 'package:favor_cate/ui/pages/filter/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:favor_cate/core/extension/int_extension.dart';

class HYHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.px,
      child: Drawer(
        child: Column(
          children: [
            buildHeaderView(context),
            buildListTile(context, Icon(Icons.restaurant), "进餐", (){
              Navigator.of(context).pop();
            }),
            buildListTile(context, Icon(Icons.settings), "过滤", (){
              Navigator.of(context).pushNamed(HYFilterScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.px,
      color: Colors.orangeAccent,
      margin: EdgeInsets.only(bottom: 20.px),
      alignment: Alignment(0, 0.5),
      child: Text(
        "开始动手",
        style: Theme.of(context).textTheme.headline1,),
    );
  }
  
  Widget buildListTile(BuildContext context, Widget icon, String title, Function handler) {
    return ListTile(
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.headline3,),
      onTap: handler,
    );
  }
}
