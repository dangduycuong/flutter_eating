import 'package:json_annotation/json_annotation.dart';

part 'search_meals_result_model.g.dart';

@JsonSerializable()
class MealsModel {
  List<MealResultItem>? meals;

  MealsModel({this.meals});

  factory MealsModel.fromJson(Map<String, dynamic> json) =>
      _$MealsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealsModelToJson(this);
}

@JsonSerializable()
class MealResultItem {
  String? idMeal;
  String? strMeal;
  String? strCategory;
  String? strArea;

  String? strInstructions;
  String? strMealThumb;
  String? strYoutube;

  MealResultItem({
    this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strYoutube,
  });

  factory MealResultItem.fromJson(Map<String, dynamic> json) =>
      _$MealResultItemFromJson(json);

  Map<String, dynamic> toJson() => _$MealResultItemToJson(this);
}
