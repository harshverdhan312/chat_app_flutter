import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String userName;
  final Function()? onTap;
  const UserTile({super.key, required this.userName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [Icon(Icons.person), SizedBox(width: 20), Text(userName)],
        ),
      ),
    );
  }
}
