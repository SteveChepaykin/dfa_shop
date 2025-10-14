import 'package:dfa_shop/core/utils/hive_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'content_data_model.freezed.dart';
part 'content_data_model.g.dart';

@freezed
@JsonSerializable()
@HiveType(typeId: HiveTypeIds.storyContentHive)
class ContentDataModel with _$ContentDataModel {
  ContentDataModel({
    required this.id,
    required this.image,
    required this.pre_title,
    required this.title,
    required this.text,
    required this.button_link,
    required this.text_position,
    required this.is_button,
  });

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String image;
  @override
  @HiveField(2)
  final String pre_title;
  @override
  @HiveField(3)
  final String title;
  @override
  @HiveField(4)
  final String text;
  @override
  @HiveField(5)
  final String button_link;
  @override
  @HiveField(6)
  final String text_position;
  @override
  @HiveField(7)
  final bool is_button;

  factory ContentDataModel.fromJson(Map<String, dynamic> json) =>
      _$ContentDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContentDataModelToJson(this);
}
