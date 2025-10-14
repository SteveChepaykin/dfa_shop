import 'package:dartz/dartz.dart';
import 'package:dfa_shop/core/network/failure.dart';
import 'package:dfa_shop/features/products/data/data_source/products_local_data_source.dart';
import 'package:dfa_shop/features/products/data/data_source/products_remote_data_source.dart';
import 'package:dfa_shop/features/products/domain/models/product_model.dart';
import 'package:dfa_shop/features/products/domain/repository/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final ProductsLocalDataSource localDataSource;

  ProductsRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final remoteProducts = await remoteDataSource.getProducts();
      return Right(
        remoteProducts
            .map(
              (product) => ProductModel(
                id: product.id,
                image: product.image,
                name: product.title,
                price: product.price,
                salePrice: product.sale_price ?? 0,
                unitValue: product.unit,
                unitString: product.unit_text,
              ),
            )
            .toList(),
      );
    } catch (e) {
      try {
        final localProducts = await localDataSource.getProducts();
        return Right(
          localProducts
              .map(
              (product) => ProductModel(
                id: product.id,
                image: product.image,
                name: product.title,
                price: product.price,
                salePrice: product.sale_price ?? 0,
                unitValue: product.unit,
                unitString: product.unit_text,
              ),
            )
            .toList(),
        );
      } catch (e) {
        return Left(ServerFailure());
      }
    }
  }
}
