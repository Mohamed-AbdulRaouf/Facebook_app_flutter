import 'package:facebook_app/models/models.dart';
import 'package:facebook_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      child: Card(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  ProfileAvatar(imageUrl: currentUser.imageUrl),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: "what's on your mind?"),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 10.0,
                thickness: 0.5,
              ),
              Container(
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      iconColor: Colors.red,
                      textColor: Colors.black45,
                      iconData: Icons.videocam,
                      onPressed: () => debugPrint("sdsds"),
                      text: "Live",
                    ),
                    VerticalDivider(
                      width: 8.0,
                    ),
                    FlatButton(
                      iconColor: Colors.green,
                      textColor: Colors.green,
                      iconData: Icons.photo_library,
                      onPressed: () => debugPrint("sdsds"),
                      text: "Photo",
                    ),
                    VerticalDivider(
                      width: 8.0,
                    ),
                    FlatButton(
                      iconColor: Colors.purpleAccent,
                      textColor: Colors.purpleAccent,
                      iconData: Icons.video_call,
                      onPressed: () => debugPrint("sdsds"),
                      text: "Room",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
