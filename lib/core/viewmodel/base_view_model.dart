import 'package:flutter/material.dart';
import 'package:favor_cate/core/model/meal_modal.dart';
import 'filter_view_model.dart';

class BaseMealViewModel extends ChangeNotifier {
  List<HYMealModel> _meals = [];

  HYFilterViewModel _filterVM;

  void updateFilters(HYFilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();
  }

  List<HYMealModel> get meals {
    // return _meals;
    // 过滤数据
    return _meals.where((meal) {
      if ( _filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if ( _filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if ( _filterVM.isVegetarian && !meal.isVegetarian) return false;
      if ( _filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  set meals(List<HYMealModel> value) {
    _meals = value;
    notifyListeners();
  }

  List<HYMealModel> get originMeals {
    return _meals;
  }
}