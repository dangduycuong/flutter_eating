// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailModel _$CocktailModelFromJson(Map<String, dynamic> json) =>
    CocktailModel(
      drinks: (json['drinks'] as List<dynamic>?)
          ?.map((e) => CocktailItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CocktailModelToJson(CocktailModel instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };

CocktailItemModel _$CocktailItemModelFromJson(Map<String, dynamic> json) =>
    CocktailItemModel(
      idDrink: json['idDrink'] as String?,
      strDrink: json['strDrink'] as String?,
      strCategory: json['strCategory'] as String?,
      strInstructions: json['strInstructions'] as String?,
      strDrinkThumb: json['strDrinkThumb'] as String?,
      strImageSource: json['strImageSource'] as String?,
    );

Map<String, dynamic> _$CocktailItemModelToJson(CocktailItemModel instance) =>
    <String, dynamic>{
      'idDrink': instance.idDrink,
      'strDrink': instance.strDrink,
      'strCategory': instance.strCategory,
      'strInstructions': instance.strInstructions,
      'strDrinkThumb': instance.strDrinkThumb,
      'strImageSource': instance.strImageSource,
    };
