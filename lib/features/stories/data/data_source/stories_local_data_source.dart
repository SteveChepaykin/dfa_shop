import 'package:dfa_shop/features/stories/data/models/story_data_model.dart';
import 'package:hive_ce/hive.dart';

abstract class StoriesLocalDataSource {
  Future<void> cacheStories(List<StoryDataModel> banners);

  Future<List<StoryDataModel>> getStories();
}

class StoriesLocalDataSourceImpl implements StoriesLocalDataSource {
  final HiveInterface hive;

  StoriesLocalDataSourceImpl(this.hive);

  @override
  Future<void> cacheStories(List<StoryDataModel> stories) async {
    final box = await hive.openBox<StoryDataModel>('stories');
    await box.clear();
    await box.addAll(stories);
  }

  @override
  Future<List<StoryDataModel>> getStories() async {
    final box = await hive.openBox<StoryDataModel>('stories');
    return box.values.toList();
  }
}