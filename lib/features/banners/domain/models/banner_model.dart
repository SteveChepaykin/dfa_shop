
import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final int id;
  final String image;

  const BannerModel({required this.id, required this.image});

  @override
  List<Object?> get props => [id, image];
}
