// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealCategoriesModel _$MealCategoriesModelFromJson(Map<String, dynamic> json) =>
    MealCategoriesModel(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoriesItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealCategoriesModelToJson(
        MealCategoriesModel instance) =>
    <String, dynamic>{
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
    };

CategoriesItemModel _$CategoriesItemModelFromJson(Map<String, dynamic> json) =>
    CategoriesItemModel(
      idCategory: json['idCategory'] as String?,
      strCategory: json['strCategory'] as String?,
      strCategoryThumb: json['strCategoryThumb'] as String?,
      strCategoryDescription: json['strCategoryDescription'] as String?,
    );

Map<String, dynamic> _$CategoriesItemModelToJson(
        CategoriesItemModel instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };
