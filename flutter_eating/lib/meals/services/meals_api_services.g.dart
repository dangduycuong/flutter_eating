// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestMealsClient implements RestMealsClient {
  _RestMealsClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.themealdb.com/api/json/v1/1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MealCategoriesModel> getAllMealCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MealCategoriesModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/categories.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MealCategoriesModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MealsModel> searchMealsByName(name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r's': name};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MealsModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/search.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MealsModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
