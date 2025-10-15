import 'package:dfa_shop/core/utils/constants.dart';
import 'package:dfa_shop/features/banners/data/models/banner_data_model.dart';
import 'package:dio/dio.dart';

abstract class BannersRemoteDataSource {
  Future<List<BannerDataModel>> getBanners();
}

class BannersRemoteDataSourceImpl implements BannersRemoteDataSource {
  final Dio dio;

  BannersRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<BannerDataModel>> getBanners() async {
    final response = await dio.get(Constants.bannersUrl);
    return (response.data['banners'] as List)
        .map((json) => BannerDataModel.fromJson(json))
        .toList();
  }
}
