import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_data_model.freezed.dart';
part 'banner_data_model.g.dart';

@freezed
class BannerDataModel with _$BannerDataModel {
  const factory BannerDataModel({
    required int id,
    required String image,
  }) = _BannerDataModel;

  const BannerDataModel._();

  factory BannerDataModel.fromJson(Map<String, dynamic> json) =>
      _$BannerDataModelFromJson(json);
      
        @override
        // TODO: implement id
        int get id => id;
      
        @override
        // TODO: implement image
        String get image => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          // TODO: implement toJson
          throw UnimplementedError();
        }
}