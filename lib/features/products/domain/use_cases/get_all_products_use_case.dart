import 'package:dartz/dartz.dart';
import 'package:dfa_shop/core/network/failure.dart';
import 'package:dfa_shop/core/use_case/base_use_case.dart';
import 'package:dfa_shop/features/products/domain/models/product_model.dart';
import 'package:dfa_shop/features/products/domain/repository/products_repository.dart';

class GetAllProductsUseCase implements BaseUseCase<List<ProductModel>, NoParams> {
  final ProductsRepository repository;

  GetAllProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams params) async {
    return await repository.getProducts();
  }
}
