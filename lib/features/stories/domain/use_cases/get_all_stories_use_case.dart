import 'package:dartz/dartz.dart';
import 'package:dfa_shop/core/network/failure.dart';
import 'package:dfa_shop/core/use_case/base_use_case.dart';
import 'package:dfa_shop/features/stories/domain/models/story_model.dart';
import 'package:dfa_shop/features/stories/domain/repository/stories_repository.dart';

class GetAllStoriesUseCase implements BaseUseCase<List<StoryModel>, NoParams> {
  final StoriesRepository repository;

  GetAllStoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<StoryModel>>> call(NoParams params) async {
    return await repository.getStories();
  }
}
