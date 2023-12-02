import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/service/product_swrvice/products_model.dart';
import 'package:river_pod/user_model.dart';

class ProductService extends AsyncNotifier<ProductsModel> {
  var dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com/'));

  Future<ProductsModel> getAllProducts() async {
    var response = await dio.get('products');
    return productsModelFromMap(jsonEncode(response.data));
  }

  Future<ProductsModel> getProductsByCategory(String catName) async {
    var response = await dio.get('products/category/$catName');
    state = AsyncData(productsModelFromMap(jsonEncode(response.data)));
    return productsModelFromMap(jsonEncode(response.data));
  }

  Future<ProductsModel> searchProduct(String query) async {
    var response =
        await dio.get('products/search', queryParameters: {'q': query});
    print(response.data);
    return productsModelFromMap(jsonEncode(response.data));
  }

  Future<Product> getSingleProduct(int id) async {
    var response = await dio.get('products/$id');
    return Product.fromMap(jsonDecode(jsonEncode(response.data)));
  }

  Future<List<UserModel>> getAllUsers() async {
    var response = await dio.get('users');
    return userModelFromMap(jsonEncode(response.data));
  }

  @override
  FutureOr<ProductsModel> build() {
    // TODO: implement build
    return getAllProducts();
  }
}

final asyncTodosProvider =
    AsyncNotifierProvider<ProductService, ProductsModel>(ProductService.new);


// final productNotifierProvider =
//     StateNotifierProvider<ProductNotifier, AsyncValue<ProductsModel>>((ref) {
//   var service = ref.read(productProvider);
//   return ProductNotifier(service);
// });

// class ProductNotifier extends StateNotifier<AsyncValue<ProductsModel>> {
//   ProductNotifier(this.service) : super(AsyncLoading()) {
//     getProducts('');
//   }
//
//   final ProductService service;
//
//   void getProducts(String query) async {
//     state = await service.getAllProducts(query);
//   }
// }
