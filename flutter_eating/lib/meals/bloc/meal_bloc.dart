import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_eating/meals/models/meal_categories_model.dart';
import 'package:flutter_eating/meals/services/meals_api_services.dart';
import 'package:flutter_eating/meals/models/search_meals_result_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:stream_transform/src/rate_limit.dart';
import 'package:stream_transform/src/switch.dart';

part 'meal_event.dart';

part 'meal_state.dart';

const _duration = Duration(milliseconds: 1200);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class MealBloc extends Bloc<MealEvent, MealState> {
  List<CategoriesItemModel> categories = [];
  List<MealResultItem> meals = [];

  MealBloc() : super(MealInitial()) {
    on<MealEvent>((event, emit) {});
    on<LoadMealCategories>(_fetchMealCategoriesData);
    on<SearchMealsByName>(_searchMealsByName, transformer: debounce(_duration));
  }

  void _searchMealsByName(
      SearchMealsByName event, Emitter<MealState> emit) async {
    meals = [];
    emit(MealLoadingData());

    Dio dio = Dio(
      BaseOptions(
          baseUrl: "https://www.themealdb.com/api/json/v1/1/",
          connectTimeout: 10000,
          contentType: "application/json"),
    );
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    final client = RestMealsClient(dio);

    try {
      MealsModel result = await client.searchMealsByName(event.text);

      if (result.meals!.isEmpty) {
        emit(SearchMealErrorState('${event.text} not found'));
      } else {
        meals = result.meals!;
        emit(MealLoadDataSuccess());
      }
    } catch (exception) {
      emit(SearchMealErrorState(exception.toString()));
    }
  }

  void _fetchMealCategoriesData(
      LoadMealCategories event, Emitter<MealState> emit) async {
    emit(MealLoadingData());
    Dio dio = Dio(
      BaseOptions(
          baseUrl: "https://www.themealdb.com/api/json/v1/1/",
          connectTimeout: 10000,
          contentType: "application/json"),
    );
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    final client = RestMealsClient(dio);

    try {
      MealCategoriesModel result = await client.getAllMealCategories();

      if (result.categories!.isNotEmpty) {
        categories = result.categories!;
        emit(MealLoadDataSuccess());
      }
    } catch (exception) {}
  }
}
