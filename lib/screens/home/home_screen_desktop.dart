import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:facebook_app/widgets/create_post_container.dart';
import 'package:facebook_app/widgets/widgets.dart';

class HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeScreenDesktop({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: MoreOptionsList(
                currentUser: currentUser,
              ),
            ),
          ),
        ),
        Spacer(),
        Container(
          width: 600.0,
          child: DesktopScreen(scrollController),
        ),
        Spacer(),
        Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: ContactsList(users: onlineUsers),
              ),
            )),
      ],
    );
  }

  Widget DesktopScreen(TrackingScrollController scrollController) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onLine: onlineUsers),
          ),
        ),
        SliverList.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            }),
      ],
    );
  }
}
