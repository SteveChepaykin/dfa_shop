import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_data_model.freezed.dart';
part 'story_data_model.g.dart';

@freezed
class StoryDataModel with _$StoryDataModel {
  const factory StoryDataModel({
    required int id,
    required String image,
    required String name,
  }) = _StoryDataModel;

  const StoryDataModel._();

  factory StoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$StoryDataModelFromJson(json);
      
        @override
        // TODO: implement id
        int get id => throw UnimplementedError();
      
        @override
        // TODO: implement image
        String get image => throw UnimplementedError();
      
        @override
        // TODO: implement name
        String get name => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          // TODO: implement toJson
          throw UnimplementedError();
        }
}
