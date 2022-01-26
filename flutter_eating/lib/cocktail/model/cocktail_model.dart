import 'package:json_annotation/json_annotation.dart';

part 'cocktail_model.g.dart';

@JsonSerializable()
class CocktailModel {
  List<CocktailItemModel>? drinks;

  CocktailModel({this.drinks});

  factory CocktailModel.fromJson(Map<String, dynamic> json) => _$CocktailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailModelToJson(this);
}

@JsonSerializable()
class CocktailItemModel {
  String? idDrink;
  String? strDrink;
  String? strCategory;
  String? strInstructions;

  String? strDrinkThumb;
  String? strImageSource;

  CocktailItemModel({
    this.idDrink,
    this.strDrink,
    this.strCategory,
    this.strInstructions,

    this.strDrinkThumb,
    this.strImageSource,
  });

  factory CocktailItemModel.fromJson(Map<String, dynamic> json) => _$CocktailItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailItemModelToJson(this);
}
