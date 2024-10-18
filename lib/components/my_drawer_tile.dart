import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final void Function()? onTap;
  const MyDrawerTile(
      {super.key,
      required this.iconData,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 5),
      child: ListTile(
        leading: Icon(iconData),
        title: Text(
          title,
          style: const TextStyle(
            letterSpacing: 3,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
