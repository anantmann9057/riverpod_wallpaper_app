import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/service/api_service.dart';
import 'package:river_pod/service/topics_service/topics_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../strings.dart';

part 'topics_service.g.dart';

@Riverpod(keepAlive: true)
class TopicsService extends _$TopicsService {
  @override
  FutureOr<List<TopicsModel>> build(int arg) {
    return getTopics();
  }

  Future<List<TopicsModel>> getTopics() async {
    var response = await ref
        .read(dioProvider)
        .get('topics', queryParameters: {'page': arg});
    return topicsModelFromMap(jsonEncode(response.data));
  }

}

var selectedTopicProvider = StateProvider((ref) => 0);
