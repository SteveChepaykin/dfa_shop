import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_data_model.freezed.dart';
part 'product_data_model.g.dart';

@freezed
class ProductDataModel with _$ProductDataModel {
  const factory ProductDataModel({
    required int id,
    required String image,
    required String name,
    required double price,
    required String description,
  }) = _ProductDataModel;

  const ProductDataModel._();

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDataModelFromJson(json);
      
        @override
        // TODO: implement description
        String get description => throw UnimplementedError();
      
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
        // TODO: implement price
        double get price => throw UnimplementedError();
      
        @override
        Map<String, dynamic> toJson() {
          // TODO: implement toJson
          throw UnimplementedError();
        }
}
