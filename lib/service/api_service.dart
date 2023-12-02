import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../strings.dart';

var dioProvider = Provider<Dio>((ref) {
  return Dio()
    ..options = BaseOptions(
        baseUrl: 'https://api.unsplash.com/',
        headers: {'Authorization': "Client-ID $ACCESS_KEY"});
});



