import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_eating/cocktail/model/cocktail_model.dart';
import 'package:flutter_eating/cocktail/service/cocktail_client.dart';
import 'package:flutter_eating/meals/bloc/meal_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'cocktail_event.dart';

part 'cocktail_state.dart';

const _duration = Duration(milliseconds: 1200);

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> {
  List<CocktailItemModel> cocktails = [];

  CocktailBloc() : super(CocktailInitial()) {
    on<CocktailEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SearchCocktailEvent>(_searchCocktailByName,
        transformer: debounce(_duration));
  }

  void _searchCocktailByName(
      SearchCocktailEvent event, Emitter<CocktailState> emit) async {
    emit(LoadingCocktailState());
    cocktails = [];

    Dio dio = Dio(
      BaseOptions(
          baseUrl: "https://www.thecocktaildb.com/api/json/v1/1/",
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

    // try {
    //   await dio.get('http://www.mocky.io/v2/5d7fc75c3300000476f0b557');
    // } catch (e) {
    //   print(e);
    // }

    final client =
        CocktailClient(dio);

    try {
      CocktailModel result = await client.getDrinks(event.text);
      cocktails = result.drinks ?? [];
      emit(SearchCocktailSuccessState());
    } catch (_) {
      emit(SearchCocktailSuccessState());
    }
  }
}
