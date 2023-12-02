import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/service/category_service/category_model.dart';

class CategoryService extends AsyncNotifier<List<String>> {
  var dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com/'));

  Future<List<String>> getCategories() async {
    var response = await dio.get('products/categories');
    print(productsCategoriesFromMap(jsonEncode(response.data)));
    return productsCategoriesFromMap(jsonEncode(response.data));
  }

  @override
  FutureOr<List<String>> build() {
    return getCategories();
  }
}

final categoriesProvider =
    AsyncNotifierProvider<CategoryService, List<String>>(CategoryService.new);
