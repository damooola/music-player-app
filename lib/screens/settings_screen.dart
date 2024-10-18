import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: context.read<ThemeProvider>().switchTheme,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.primary),
          child: ListTile(
              title: Text(isDarkMode ? "Dark Mode" : "Light Mode"),
              leading: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
              trailing: CupertinoSwitch(
                  value: isDarkMode,
                  onChanged: (value) =>
                      context.read<ThemeProvider>().switchTheme())),
        ),
      ),
    );
  }
}
