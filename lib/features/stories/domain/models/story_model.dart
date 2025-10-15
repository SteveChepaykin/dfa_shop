
import 'package:equatable/equatable.dart';

class StoryModel extends Equatable {
  final int id;
  final String image;
  final String name;
  final bool isSeen;

  const StoryModel({
    required this.id,
    required this.image,
    required this.name,
    required this.isSeen,
  });

  @override
  List<Object?> get props => [id, image, name];
}
