import 'package:flutter/material.dart';
import 'package:favor_cate/core/extension/int_extension.dart';

class HYOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final Color textColor;

  HYOperationItem(this._icon, this._title, {this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.px,
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon,
          SizedBox(width: 5.px),
          Text(_title, style: TextStyle(color: textColor),),
        ],
      ),
    );
  }
}
