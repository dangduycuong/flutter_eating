// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_meals_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsModel _$MealsModelFromJson(Map<String, dynamic> json) => MealsModel(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => MealResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealsModelToJson(MealsModel instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

MealResultItem _$MealResultItemFromJson(Map<String, dynamic> json) =>
    MealResultItem(
      idMeal: json['idMeal'] as String?,
      strMeal: json['strMeal'] as String?,
      strCategory: json['strCategory'] as String?,
      strArea: json['strArea'] as String?,
      strInstructions: json['strInstructions'] as String?,
      strMealThumb: json['strMealThumb'] as String?,
      strYoutube: json['strYoutube'] as String?,
    );

Map<String, dynamic> _$MealResultItemToJson(MealResultItem instance) =>
    <String, dynamic>{
      'idMeal': instance.idMeal,
      'strMeal': instance.strMeal,
      'strCategory': instance.strCategory,
      'strArea': instance.strArea,
      'strInstructions': instance.strInstructions,
      'strMealThumb': instance.strMealThumb,
      'strYoutube': instance.strYoutube,
    };
