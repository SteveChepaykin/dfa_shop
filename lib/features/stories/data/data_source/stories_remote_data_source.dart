import 'package:dfa_shop/features/stories/data/models/story_data_model.dart';
import 'package:dio/dio.dart';

abstract class StoriesRemoteDataSource {
  Future<List<StoryDataModel>> getStories();
}

class StoriesRemoteDataSourceImpl implements StoriesRemoteDataSource {
  final Dio dio;

  StoriesRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<StoryDataModel>> getStories() async {
    final response = await dio.get('https://bxtest.dfa-media.ru/udachny/story.json');
    return (response.data as List)
        .map((json) => StoryDataModel.fromJson(json))
        .toList();
  }
}
