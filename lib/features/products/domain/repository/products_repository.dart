
import 'package:dartz/dartz.dart';
import 'package:dfa_shop/core/network/failure.dart';
import 'package:dfa_shop/features/products/domain/models/product_model.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}
