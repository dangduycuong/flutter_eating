import 'package:flutter_eating/meals/models/meal_categories_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_eating/meals/models/search_meals_result_model.dart';

part 'meals_api_services.g.dart';

@RestApi(baseUrl: "https://www.themealdb.com/api/json/v1/1")
abstract class RestMealsClient {
  factory RestMealsClient(Dio dio, {String baseUrl}) = _RestMealsClient;

  @GET("/categories.php")
  Future<MealCategoriesModel> getAllMealCategories();

  @GET("/search.php")
  Future<MealsModel> searchMealsByName(
    @Query("s") String name,
  );
}
