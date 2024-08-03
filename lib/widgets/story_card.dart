import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app/config/palette.dart';
import 'package:facebook_app/widgets/profile_avatar.dart';
import 'package:facebook_app/widgets/responsive.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class StoryCard extends StatelessWidget {
  final bool? isAddStory;
  final User currentUser;
  final Story? story;

  const StoryCard(
      {super.key,
      this.isAddStory = false,
      required this.currentUser,
      this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: currentUser.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: Responsive.isDesktop(context)
                ? [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4.0)
                  ]
                : null,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory ?? false
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      debugPrint("add story");
                    },
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.add,
                      size: 30.0,
                      color: Palette.facebookBlue,
                    ),
                  ),
                )
              : ProfileAvatar(
                  imageUrl: story!.user.imageUrl,
                  isHasBorder: story!.isViewed ?? false,
                ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ?? false ? "Add to story" : story!.user.name,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
