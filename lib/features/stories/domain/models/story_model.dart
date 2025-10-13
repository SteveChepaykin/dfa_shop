
import 'package:equatable/equatable.dart';

class StoryModel extends Equatable {
  final int id;
  final String image;
  final String name;

  const StoryModel({
    required this.id,
    required this.image,
    required this.name,
  });

  @override
  List<Object?> get props => [id, image, name];
}
