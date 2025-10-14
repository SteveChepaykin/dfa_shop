import 'package:dfa_shop/core/utils/hive_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'message_data_model.freezed.dart';
part 'message_data_model.g.dart';

@freezed
@JsonSerializable()
@HiveType(typeId: HiveTypeIds.messageHive)
class MessageDataModel with _$MessageDataModel {
  MessageDataModel({
    required this.id,
    required this.message,
    required this.senderId,
    required this.timestamp,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String message;
  @HiveField(2)
  final String senderId;
  @HiveField(3)
  final DateTime timestamp;

  factory MessageDataModel.fromJson(Map<String, dynamic> json) =>
      _$MessageDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDataModelToJson(this);
}
