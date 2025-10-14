import 'package:dfa_shop/features/stories/domain/models/story_model.dart';
import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({required this.story, super.key});

  final StoryModel story;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200], // Adjust color as needed
            child: Icon(Icons.person, color: Colors.grey[600], size: 30),
          ),
          SizedBox(height: 8),
          Text(story.name, textAlign: TextAlign.center, style: TextStyle(fontSize: 12), maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}