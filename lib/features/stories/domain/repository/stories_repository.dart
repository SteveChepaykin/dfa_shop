
import 'package:dartz/dartz.dart';
import 'package:dfa_shop/core/network/failure.dart';
import 'package:dfa_shop/features/stories/domain/models/story_model.dart';

abstract class StoriesRepository {
  Future<Either<Failure, List<StoryModel>>> getStories();
}
