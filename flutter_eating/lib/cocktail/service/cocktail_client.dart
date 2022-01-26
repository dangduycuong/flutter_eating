import 'package:dio/dio.dart';
import 'package:flutter_eating/cocktail/model/cocktail_model.dart';
import 'package:retrofit/retrofit.dart';

part 'cocktail_client.g.dart';

@RestApi(
    baseUrl:
        "https://www.thecocktaildb.com/api/json/v1/1")
abstract class CocktailClient {
  factory CocktailClient(Dio dio, {String baseUrl}) = _CocktailClient;

  @GET("/search.php")
  Future<CocktailModel> getDrinks(
    @Query('s') String drink,
  );
}
