import 'package:dartz/dartz.dart';
import 'package:dfa_shop/core/network/failure.dart';
import 'package:dfa_shop/features/banners/domain/models/banner_model.dart';

abstract class BannersRepository {
  Future<Either<Failure, List<BannerModel>>> getBanners();
}
