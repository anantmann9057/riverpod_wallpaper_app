import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/service/collection_service/collections_model.dart';
import 'package:river_pod/strings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api_service.dart';
part 'collection_service.g.dart';

@Riverpod(keepAlive: true)
class CollectionService extends _$CollectionService {


  @override
  FutureOr<List<CollectionsModel>> build(int arg) {
    return getAllCollections();
  }

  Future<List<CollectionsModel>> getAllCollections() async {
    var response =  await ref.read(dioProvider).get('collections',
        queryParameters: { 'order_by': 'popular','page':arg});
    return collectionsModelFromMap(jsonEncode(response.data));
  }

}


