import 'package:dartz/dartz.dart';
import 'package:dfa_shop/core/network/failure.dart';
import 'package:dfa_shop/core/use_case/base_use_case.dart';
import 'package:dfa_shop/features/banners/domain/models/banner_model.dart';
import 'package:dfa_shop/features/banners/domain/repository/banners_repository.dart';

class GetAllBannersUseCase implements BaseUseCase<List<BannerModel>, NoParams> {
  final BannersRepository repository;

  GetAllBannersUseCase(this.repository);

  @override
  Future<Either<Failure, List<BannerModel>>> call(NoParams params) async {
    return await repository.getBanners();
  }
}
