import 'package:flutter/material.dart';
import 'package:music_player/components/my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const DrawerHeader(
                child: Icon(
                  Icons.music_note,
                  size: 50,
                ),
              ),
              const SizedBox(height: 10),
              MyDrawerTile(
                iconData: Icons.home,
                title: "HOME",
                onTap: () => Navigator.pop(context),
              ),
              MyDrawerTile(
                iconData: Icons.settings,
                title: "SETTINGS",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/settings_screen");
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 10),
            child: MyDrawerTile(
              iconData: Icons.logout,
              title: "LOGOUT",
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
