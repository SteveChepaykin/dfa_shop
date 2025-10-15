import 'package:dfa_shop/core/utils/constants.dart';
import 'package:dfa_shop/features/products/data/models/product_data_model.dart';
import 'package:dio/dio.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductDataModel>> getProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final Dio dio;

  ProductsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductDataModel>> getProducts() async {
    final response = await dio.get(Constants.productsUrl);
    return (response.data['products'] as List)
        .map((json) => ProductDataModel.fromJson(json))
        .toList();
  }
}
