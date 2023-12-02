import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/main.dart';
import 'package:river_pod/service/photo_service/photos_model.dart';
import 'package:river_pod/strings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api_service.dart';

part 'photo_service.g.dart';
@Riverpod(keepAlive: true)
class PhotoService extends _$PhotoService {
  var dio = Dio(BaseOptions(
      baseUrl: 'https://api.unsplash.com/',
      headers: {'Authorization': "Client-ID $ACCESS_KEY"}));

  Future<List<PhotosModel>> getAllPhotos() async {
    var response = await dio.get('photos', queryParameters: {
      'order_by': 'popular',
      'page': arg
    });
    return photosModelFromMap(jsonEncode(response.data));
  }

  Future<List<PhotosModel>> searchPhotos(String query) async {
    var response =   await ref.read(dioProvider).get('/search/photos', queryParameters: {
      'query': query,
      'order_by': 'popular'
    });
    return photosModelFromMap(jsonEncode(response.data));
  }

  @override
  FutureOr<List<PhotosModel>> build(int arg) {
    return getAllPhotos();
  }
}


