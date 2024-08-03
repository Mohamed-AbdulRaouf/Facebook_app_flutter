import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app/models/models.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(
          horizontal: isDesktop ? 5.0 : 5.0, vertical: isDesktop ? 5.0 : 5.0),
      elevation: isDesktop ? 1.0 : 1.0,
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )
          : null,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PostHeader(post: post),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6.0,
                        )
                ],
              ),
            ),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(imageUrl: post.imageUrl),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: PostStats(post: post),
            )
          ],
        ),
      ),
    );
  }
}
