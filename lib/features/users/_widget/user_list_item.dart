import 'package:flutter/material.dart';
import 'package:mobxasync/features/_model/user.dart';

class UserListItem extends StatelessWidget {
  final User user;

  const UserListItem({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: ClipOval(child: Image.network(user.avatar)),
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
    );
  }
}
