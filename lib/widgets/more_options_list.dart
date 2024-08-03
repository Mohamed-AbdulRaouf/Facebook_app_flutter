import 'package:facebook_app/config/palette.dart';
import 'package:facebook_app/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../models/models.dart';
import 'option_menu.dart';

class MoreOptionsList extends StatelessWidget {
  final User currentUser;

  const MoreOptionsList({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    List<List>? moreOptionsList = [
      [MdiIcons.shieldAccount, Colors.deepPurple, "COVID-19 Info Center"],
      [MdiIcons.accountMultiple, Colors.cyan, "Friends"],
      [MdiIcons.facebookMessenger, Palette.facebookBlue, "Messenger"],
      [MdiIcons.flag, Colors.orange, "Pages"],
      [MdiIcons.storefront, Palette.facebookBlue, "Marketplace"],
      [Icons.ondemand_video, Palette.facebookBlue, "Watch"],
      [MdiIcons.calendarStar, Colors.red, "Events"],
    ];

    return Container(
      constraints: BoxConstraints(maxWidth: 280),
      child: ListView.builder(
          itemCount: moreOptionsList?.length ?? 0 + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: UserCard(
                  user: currentUser,
                ),
              );
            }
            final List? option = moreOptionsList?[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: OptionMenu(
                icon: option?[0],
                color: option?[1],
                label: option?[2],
              ),
            );
          }),
    );
  }
}
