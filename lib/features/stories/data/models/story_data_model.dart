import 'package:dfa_shop/core/utils/hive_types.dart';
import 'package:dfa_shop/features/stories/data/models/content_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'story_data_model.freezed.dart';
part 'story_data_model.g.dart';

@freezed
@JsonSerializable()
@HiveType(typeId: HiveTypeIds.storyHive)
class StoryDataModel with _$StoryDataModel {
  StoryDataModel({
    required this.id,
    required this.preview_image,
    required this.viewed,
    required this.is_bookmark,
    required this.position,
    required this.title,
    required this.slides,
  });

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String preview_image;
  @override
  @HiveField(2)
  final bool viewed;
  @override
  @HiveField(3)
  final bool is_bookmark;
  @override
  @HiveField(4)
  final String position;
  @override
  @HiveField(5)
  final String title;
  @override
  @HiveField(6)
  final List<ContentDataModel> slides;

  factory StoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$StoryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryDataModelToJson(this);
}
