import 'package:flutter/material.dart';
import 'package:music_player/models/songlist_provider.dart';
import 'package:music_player/screens/settings_screen.dart';
import 'package:music_player/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => SongListProvider())
    ],
    child: const MusicPlayerApp(),
  ));
}

class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: context.watch<ThemeProvider>().themeData,
      routes: {
        "/home_screen": (context) => const HomeScreen(),
        "/settings_screen": (context) => const SettingsScreen(),
      },
    );
  }
}
