import 'package:flutter/material.dart';

class HYAppTheme {
  // 1.共有属性
  static final double bodyFontSize = 14;
  static final double smallFontSize = 16;
  static final double normalFontSize = 22;
  static final double largeFontSize = 24;
  static final double xlargeFontSize = 30;

  // 2.普通模式
  static final Color norTextColors = Colors.red;

  static final ThemeData norTheme = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
    textTheme: TextTheme(
      bodyText2: TextStyle(fontSize: bodyFontSize, color: Colors.black87),
      headline4: TextStyle(fontSize: smallFontSize, color: Colors.black87),
      headline3: TextStyle(fontSize: normalFontSize, color: Colors.black87),
      headline2: TextStyle(fontSize: largeFontSize, color: Colors.black87),
      headline1: TextStyle(fontSize: xlargeFontSize, color: Colors.black87, fontWeight: FontWeight.w400),
    )
  );

  // 3.暗黑模式
  static final Color darkTextColors = Colors.green;

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      textTheme: TextTheme(
        body1: TextStyle(fontSize: normalFontSize, color: darkTextColors)
      )
  );

}