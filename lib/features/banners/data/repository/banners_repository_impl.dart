
import 'package:dartz/dartz.dart';
import 'package:dfa_shop/core/network/failure.dart';
import 'package:dfa_shop/features/banners/data/data_source/banners_local_data_source.dart';
import 'package:dfa_shop/features/banners/data/data_source/banners_remote_data_source.dart';
import 'package:dfa_shop/features/banners/domain/models/banner_model.dart';
import 'package:dfa_shop/features/banners/domain/repository/banners_repository.dart';

class BannersRepositoryImpl implements BannersRepository {
  final BannersRemoteDataSource remoteDataSource;
  final BannersLocalDataSource localDataSource;

  BannersRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<BannerModel>>> getBanners() async {
    try {
      final remoteBanners = await remoteDataSource.getBanners();
      return Right(remoteBanners
          .map((banner) => BannerModel(id: banner.id, image: banner.image, link: banner.link,),)
          .toList());
    } catch (e) {
      try {
        final localProducts = await localDataSource.getBanners();
        return Right(localProducts
            .map((banner) => BannerModel(id: banner.id, image: banner.image, link: banner.link,),)
          .toList());
      } catch (e) {
        return Left(ServerFailure());
      }
    }
  }
}
