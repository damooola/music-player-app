import 'package:flutter/material.dart';
import 'package:music_player/components/neu_box.dart';
import 'package:music_player/models/songlist_provider.dart';
import 'package:provider/provider.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  //convert duratiion min:sec
  String formatDuration(Duration duration) {
    String secondsInTwoDigits =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$secondsInTwoDigits";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SongListProvider>(
      builder: (context, value, child) {
        // get songlist
        final songlist = value.songList;

        // get current song index
        final currentSongIndex = value.currentSongIndex;

        // current song
        final currentSong = songlist[currentSongIndex ?? 0];
        // return ui
        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                child: Column(
                  children: [
                    // app bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // back button
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back)),
                        // song title
                        Expanded(
                          child: Center(
                            child: Text(
                                "${currentSong.songName} - ${currentSong.artistname}",
                                style: const TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 20,
                                    overflow: TextOverflow.ellipsis)),
                          ),
                        ),
                        // menu button
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.menu))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // album art
                    NeuBox(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(currentSong.coverArtImagePath)),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(currentSong.songName,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary)),
                                Text(currentSong.artistname,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary))
                              ],
                            ),
                            const Icon(
                              Icons.favorite_rounded,
                              color: Colors.red,
                              size: 35,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    )),
                    const SizedBox(
                      height: 35,
                    ),

                    // song duration progress
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // start time
                              Text(formatDuration(value.currentDuration)),
                              // repeat
                              const Icon(Icons.repeat),
                              // shuffle
                              const Icon(Icons.shuffle),
                              // end time
                              Text(formatDuration(value.totalDuration))
                            ],
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 5,
                          )),
                          child: Slider(
                            inactiveColor:
                                Theme.of(context).colorScheme.secondary,
                            value: value.currentDuration.inSeconds.toDouble(),
                            min: 0,
                            max: value.totalDuration.inSeconds.toDouble(),
                            activeColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            onChanged: (double double) {
                              // when user drags slider around
                            },
                            onChangeEnd: (double double) {
                              // when finished sliding, go to that position in song
                              value.seek(Duration(seconds: double.toInt()));
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // playback control
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: value.playPreviousSong,
                              child: const NeuBox(
                                  child: Icon(
                                (Icons.skip_previous),
                              )),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                                onTap: value.pauseOrResumeSong,
                                child: NeuBox(
                                    child: Icon(value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow))),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: value.playNextSong,
                              child: const NeuBox(
                                child: Icon(
                                  Icons.skip_next,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
