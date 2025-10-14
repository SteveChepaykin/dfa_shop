import 'package:dfa_shop/core/utils/hive_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'banner_data_model.freezed.dart';
part 'banner_data_model.g.dart';

@freezed
@JsonSerializable()
@HiveType(typeId: HiveTypeIds.bannerHive)
class BannerDataModel with _$BannerDataModel {
  BannerDataModel({
    required this.id,
    required this.image,
    required this.link,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String link;

  factory BannerDataModel.fromJson(Map<String, dynamic> json) =>
      _$BannerDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerDataModelToJson(this);
}