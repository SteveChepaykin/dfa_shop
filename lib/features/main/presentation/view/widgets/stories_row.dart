import 'package:dfa_shop/features/main/presentation/view/widgets/story_item.dart';
import 'package:dfa_shop/features/stories/domain/models/story_model.dart';
import 'package:flutter/material.dart';

class StoriesRow extends StatelessWidget {
  const StoriesRow({required this.stories, super.key});

  final List<StoryModel> stories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 120, // Height for category items
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...stories.map((str) => StoryItem(story: str)),
          ],
        ),
      ),
    );
  }
}
