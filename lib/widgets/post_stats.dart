import 'package:facebook_app/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../models/models.dart';
import 'widgets.dart';

class PostStats extends StatelessWidget {
  final Post post;

  const PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
                child: Text(
              "${post.likes}",
              style: TextStyle(color: Colors.grey.shade600),
            )),
            Text(
              "${post.comments} Comments",
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              "${post.shares} Shares",
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
        Divider(
          color: Colors.white,
        ),
        Row(
          children: [
            PostButton(
              icon: Icon(MdiIcons.thumbUpOutline,
                  color: Colors.grey.shade600, size: 15.0),
              label: "Like",
              onTap: () => debugPrint("Like"),
            ),
            PostButton(
              icon: Icon(MdiIcons.commentOutline,
                  color: Colors.grey.shade600, size: 15.0),
              label: "Comment",
              onTap: () => debugPrint("Comment"),
            ),
            PostButton(
              icon: Icon(MdiIcons.shareOutline,
                  color: Colors.grey.shade600, size: 15.0),
              label: "Share",
              onTap: () => debugPrint("Share"),
            )
          ],
        )
      ],
    );
  }
}
