import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'song.dart';

class SongListProvider extends ChangeNotifier {
// list of songs
  final List<Song> _songList = [
    Song(
        songName: "Perfect",
        artistname: "Ed Sheeran",
        coverArtImagePath: "assets/images/÷.jpg",
        audioPath: "assets/audio/Perfect.mp3"),
    Song(
        songName: "Photograph",
        artistname: "Ed Sheeran",
        coverArtImagePath: "assets/images/x.jpg",
        audioPath: "assets/audio/Photograph.mp3"),
    Song(
        songName: "Shivers",
        artistname: "Ed Sheeran",
        coverArtImagePath: "assets/images/=.jpg",
        audioPath: "assets/audio/Shivers.mp3"),
  ];

// audioplayer
  final AudioPlayer _audioPlayer = AudioPlayer();

  // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  SongListProvider() {
    listenToDuration();
  }

  // initially not playing
  bool _isPlaying = false;

  // play song
  void playSong() async {
    final String currentSongPath = _songList[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // stop if another song is playing
    await _audioPlayer.play(AssetSource(currentSongPath)); // play new song
    _isPlaying = true;
    notifyListeners();
  }

  // pause song
  void pauseSong() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume song
  void resumeSong() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume song
  void pauseOrResumeSong() async {
    if (_isPlaying) {
      pauseSong();
    } else {
      resumeSong();
    }
    notifyListeners();
  }

  // seek to time
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      // if not the last song
      if (_currentSongIndex! < _songList.length - 1) {
        // play next song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        // play first song
        currentSongIndex = 0;
      }
    }
  }

  // play previous
  void playPreviousSong() async {
    //if song after 5 seconeds go back to beginning of song
    if (_currentDuration.inSeconds > 5) {
      seek(Duration.zero);
    } else {
      // go to previous song
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        // if first song, go to last song
        currentSongIndex = _songList.length - 1;
      }
    }
  }

  // listen to duartions
  void listenToDuration() {
    //listen total duration
    _audioPlayer.onDurationChanged.listen(
      (newDuration) {
        _totalDuration = newDuration;
        notifyListeners();
      },
    );

    // listen current duration
    _audioPlayer.onPositionChanged.listen(
      (newPosition) {
        _currentDuration = newPosition;
        notifyListeners();
      },
    );

    // listen for song completion
    _audioPlayer.onPlayerComplete.listen(
      (event) {
        playNextSong();
      },
    );
  }

  // dispose audioplayer

  // index of current playing song
  int? _currentSongIndex;

  // get song list
  List<Song> get songList => _songList;

  // get current song index
  int? get currentSongIndex => _currentSongIndex;

  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  // current song index setter
  set currentSongIndex(int? index) {
    _currentSongIndex = index;
    if (index != null) {
      playSong();
    }
    notifyListeners();
  }
}
