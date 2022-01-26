// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _CocktailClient implements CocktailClient {
  _CocktailClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.thecocktaildb.com/api/json/v1/1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CocktailModel> getDrinks(drink) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r's': drink};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CocktailModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/search.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CocktailModel.fromJson(_result.data!);
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
