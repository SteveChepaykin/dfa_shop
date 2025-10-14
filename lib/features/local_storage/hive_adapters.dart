import 'package:dfa_shop/features/banners/data/models/banner_data_model.dart';
import 'package:dfa_shop/features/products/data/models/product_data_model.dart';
import 'package:dfa_shop/features/stories/data/models/story_data_model.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> init() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(BannerDataModelAdapter());
  Hive.registerAdapter(ProductDataModelAdapter());
  Hive.registerAdapter(StoryDataModelAdapter());
}