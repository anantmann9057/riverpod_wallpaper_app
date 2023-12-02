import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/service/api_service.dart';
import 'package:river_pod/service/topics_service/topic_image/topic_image_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'topic_image_service.g.dart';

@riverpod
class TopicImageService extends _$TopicImageService {
  @override
  FutureOr<List<TopicImageModel>> build(String arg) {
    return getTopicImages(1);
  }

  Future<List<TopicImageModel>> getTopicImages(int page) async {
    var response = await ref.read(dioProvider).get('topics/$arg/photos',queryParameters: {'page':page});

    return topicImageModelFromMap(jsonEncode(response.data));
  }
}
