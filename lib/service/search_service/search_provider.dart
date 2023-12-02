import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/service/search_service/search_model.dart';
import 'package:river_pod/strings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api_service.dart';
part 'search_provider.g.dart';

@Riverpod(keepAlive: true)
class SearchService extends _$SearchService {
  var dio = Dio(BaseOptions(
      baseUrl: 'https://api.unsplash.com/',
      headers: {'Authorization': "Client-ID $ACCESS_KEY"}));

  @override
  FutureOr<List<Result>> build(int arg) {
    return searchPhotos(query: 'best');
  }

  Future<List<Result>> searchPhotos({String query = 'l'}) async {
    var response =  await ref.read(dioProvider).get('search/collections', queryParameters: {
      'query': query,
      'order_by': 'popular',
      'page':arg
    });
    print(searchModelFromMap(jsonEncode(response.data)).results);
    return searchModelFromMap(jsonEncode(response.data)).results??[];
  }
}


