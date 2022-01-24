import 'package:json_annotation/json_annotation.dart';

part 'meal_categories_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MealCategoriesModel {
  List<CategoriesItemModel>? categories;

  MealCategoriesModel({this.categories});

  factory MealCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$MealCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealCategoriesModelToJson(this);
}

@JsonSerializable()
class CategoriesItemModel {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  CategoriesItemModel({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory CategoriesItemModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesItemModelToJson(this);
}
