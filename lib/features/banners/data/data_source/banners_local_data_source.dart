import 'package:dfa_shop/features/banners/data/models/banner_data_model.dart';
import 'package:hive_ce/hive.dart';

abstract class BannersLocalDataSource {
  Future<void> cacheBanners(List<BannerDataModel> banners);

  Future<List<BannerDataModel>> getBanners();
}

class BannersLocalDataSourceImpl implements BannersLocalDataSource {
  final HiveInterface hive;

  BannersLocalDataSourceImpl(this.hive);

  @override
  Future<void> cacheBanners(List<BannerDataModel> banners) async {
    final box = await hive.openBox<BannerDataModel>('banners');
    await box.clear();
    await box.addAll(banners);
  }

  @override
  Future<List<BannerDataModel>> getBanners() async {
    final box = await hive.openBox<BannerDataModel>('banners');
    return box.values.toList();
  }
}
