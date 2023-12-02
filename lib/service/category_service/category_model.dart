// To parse this JSON data, do
//
//     final productsCategories = productsCategoriesFromMap(jsonString);

import 'dart:convert';

List<String> productsCategoriesFromMap(String str) => List<String>.from(json.decode(str).map((x) => x));

String productsCategoriesToMap(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
