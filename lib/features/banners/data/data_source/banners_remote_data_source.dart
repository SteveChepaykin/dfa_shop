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
    final response = await dio.get('https://bxtest.dfa-media.ru/udachny/banners.json');
    return (response.data as List)
        .map((json) => BannerDataModel.fromJson(json))
        .toList();
  }
}
