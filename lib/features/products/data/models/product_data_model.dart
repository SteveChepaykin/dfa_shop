import 'package:dfa_shop/core/utils/hive_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'product_data_model.freezed.dart';
part 'product_data_model.g.dart';

@freezed
@JsonSerializable()
@HiveType(typeId: HiveTypeIds.productHive)
class ProductDataModel with _$ProductDataModel {
  ProductDataModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.sale_price,
    required this.unit,
    required this.unit_text,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final double? sale_price;
  @HiveField(5)
  final int unit;
  @HiveField(6)
  final String unit_text;

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataModelToJson(this);
}
