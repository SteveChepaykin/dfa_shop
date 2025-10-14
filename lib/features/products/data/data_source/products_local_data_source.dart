import 'package:dfa_shop/features/products/data/models/product_data_model.dart';
import 'package:hive_ce/hive.dart';

abstract class ProductsLocalDataSource {
  Future<void> cacheProducts(List<ProductDataModel> banners);

  Future<List<ProductDataModel>> getProducts();
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  final HiveInterface hive;

  ProductsLocalDataSourceImpl(this.hive);

  @override
  Future<void> cacheProducts(List<ProductDataModel> products) async {
    final box = await hive.openBox<ProductDataModel>('products');
    await box.clear();
    await box.addAll(products);
  }

  @override
  Future<List<ProductDataModel>> getProducts() async {
    final box = await hive.openBox<ProductDataModel>('products');
    return box.values.toList();
  }
}