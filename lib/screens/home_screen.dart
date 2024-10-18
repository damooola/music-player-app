import 'package:flutter/material.dart';
import 'package:music_player/components/my_drawer.dart';
import 'package:music_player/models/songlist_provider.dart';
import 'package:music_player/screens/song_screen.dart';
import 'package:provider/provider.dart';

import '../models/song.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final dynamic songListProvider;

  @override
  void initState() {
    super.initState();
    songListProvider = Provider.of<SongListProvider>(context, listen: false);
  }

// play song
  void goToSongScreen(int songIndex) {
    songListProvider.currentSongIndex = songIndex;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SongScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MUSIC",
            style: TextStyle(letterSpacing: 2, fontSize: 20)),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Consumer<SongListProvider>(builder: (context, value, child) {
        final List<Song> songList = value.songList;
        return ListView.builder(
          itemCount: songList.length,
          itemBuilder: (context, index) {
            // each song in list
            final Song song = songList[index];
            return ListTile(
              leading: Image.asset(song.coverArtImagePath),
              title: Text(song.songName,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary)),
              subtitle: Text(
                song.artistname,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
              onTap: () => goToSongScreen(index),
            );
          },
        );
      }),
    );
  }
}
