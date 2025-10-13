import 'package:dartz/dartz.dart';
import 'package:dfa_shop/core/network/failure.dart';
import 'package:dfa_shop/features/stories/data/data_source/stories_remote_data_source.dart';
import 'package:dfa_shop/features/stories/domain/models/story_model.dart';
import 'package:dfa_shop/features/stories/domain/repository/stories_repository.dart';

class StoriesRepositoryImpl implements StoriesRepository {
  final StoriesRemoteDataSource remoteDataSource;

  StoriesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<StoryModel>>> getStories() async {
    try {
      final remoteStories = await remoteDataSource.getStories();
      return Right(remoteStories
          .map((story) =>
              StoryModel(id: story.id, image: story.image, name: story.name,),)
          .toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}