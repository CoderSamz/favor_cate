import 'package:favor_cate/core/model/meal_modal.dart';
import 'base_view_model.dart';

class HYFavorViewModel extends BaseMealViewModel {

  void addMeal(HYMealModel meal) {
    originMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(HYMealModel meal) {
    originMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(HYMealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }
  bool isFavor(HYMealModel meal){
    return meals.contains(meal);
  }
}