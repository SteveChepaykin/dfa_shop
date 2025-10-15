import 'package:dfa_shop/core/utils/app_theme.dart';
import 'package:dfa_shop/features/stories/domain/models/story_model.dart';
import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({required this.story, super.key});

  final StoryModel story;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 5),
      child: Column(
        children: [
          CircleAvatar(
            radius: 33.5,
            backgroundColor: story.isSeen ? Colors.transparent : AppTheme.grey,
            child: CircleAvatar(
              radius: 32.5,
              backgroundColor: AppTheme.bg,
              child: CircleAvatar(
                radius: 31,
                backgroundColor: Colors.grey[200],
                child: Image.network(story.image),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            story.name, 
            textAlign: TextAlign.center, 
            style: AppTheme.s10w400.copyWith(height: 1.2), 
            maxLines: 3, 
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}