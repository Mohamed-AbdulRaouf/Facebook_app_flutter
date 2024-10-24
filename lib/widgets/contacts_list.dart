import 'package:facebook_app/widgets/user_card.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  const ContactsList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Contacts",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey.shade600,
              ),
              SizedBox(
                width: 8.0,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey.shade600,
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final User user = users[index];
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: UserCard(
                        user: user,
                      ));
                }),
          )
        ],
      ),
    );
  }
}
