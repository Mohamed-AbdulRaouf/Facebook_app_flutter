import 'package:facebook_app/config/palette.dart';
import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/models/user_model.dart';
import 'package:facebook_app/widgets/profile_avatar.dart';
import 'package:facebook_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onLine;

  const Rooms({super.key, required this.onLine});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(
          horizontal: isDesktop ? 5.0 : 5.0, vertical: isDesktop ? 5.0 : 5.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )
          : null,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        height: 60.0,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            scrollDirection: Axis.horizontal,
            itemCount: onlineUsers.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: _CreateRoomButton(),
                );
              }
              final User user = onLine[index - 1];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isOnline: true,
                ),
              );
            }),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(width: 3.0, color: Colors.blueAccent.shade100),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10.0,
          ),
          ShaderMask(
              shaderCallback: (Rect bounds) =>
                  Palette.createRoomGradient.createShader(bounds),
              child: Icon(
                Icons.video_call,
                size: 30.0,
                color: Colors.white,
              )),
          SizedBox(
            width: 4.0,
          ),
          Text(
            "Create\nRoom",
            style: TextStyle(fontSize: 12.0, color: Palette.facebookBlue),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
