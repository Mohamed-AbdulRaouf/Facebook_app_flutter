import 'package:facebook_app/config/palette.dart';
import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:facebook_app/widgets/create_post_container.dart';
import 'package:facebook_app/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeScreenMobile({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Facebook Raouf",
            style: TextStyle(
                fontSize: 28.0,
                color: Palette.facebookBlue,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
                icon: Icons.search,
                onPressed: () {
                  debugPrint("search");
                }),
            CircleButton(
                icon: MdiIcons.facebookMessenger,
                onPressed: () {
                  debugPrint("chat");
                }),
          ],
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
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
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
