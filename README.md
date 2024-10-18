# Flutter Music Player

A music player application built with Flutter. This app demonstrates the implementation of a local music player with a clean UI and state management using Provider.

## Features

- 🎵 Local audio playback
- 🎨 Modern, minimalist UI design
- ⏯️ Basic playback controls (play, pause, next, previous)
- 🎼 Progress bar with seek functionality

## Project Structure

```
lib/
├── components/
│   ├── my_drawer_tile.dart
│   ├── my_drawer.dart
│   └── neu_box.dart
├── models/
│   ├── song.dart
│   └── songlist_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── settings_screen.dart
│   └── song_screen.dart
├── theme/
│   ├── dark_mode.dart
│   ├── light_mode.dart
│   ├── theme_provider.dart
└── main.dart
```

### Key Components

- `SongListProvider`: Manages the state of the music player and handles audio playback
- `HomeScreen`: Displays the list of available songs
- `SongScreen`: Shows the now playing interface with playback controls
- `Song`: Model class for song data

## Setup

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:

```bash
git clone [https://github.com/damooola/music-player-app.git]
```

2. Install dependencies:

```bash
flutter pub get
```

3. Add your audio files to the `assets/audio/` directory

4. Update `pubspec.yaml` to include your assets:

```yaml
flutter:
  assets:
    - assets/audio/
    - assets/images/
```

### Required Dependencies

Add these to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.2
  audioplayers: ^6.1.0
```

## File Structure Details

### songlist_provider.dart

Manages the state of the music player including:

- Song list management
- Audio playback controls
- Duration tracking
- Audio session handling

Key methods:

- `playSong()`: Plays the selected song
- `pauseSong()`: Pauses current playback
- `resumeSong()`: Resumes paused playback
- `seek()`: Seeks to specific position in the song
- `playNextSong()`: Plays the next song in the list
- `playPreviousSong()`: Plays the previous song

### song_screen.dart

The main playback interface featuring:

- Album art display
- Playback controls
- Progress bar
- Song information
- Duration display

### home_screen.dart

The main list view showing:

- List of available songs
- Album art thumbnails
- Song and artist information
- Navigation to song playback screen

## Usage

1. Adding Songs:

```dart
// In songlist_provider.dart
final List<Song> _songList = [
    Song(
        songName: "Song Name",
        artistname: "Artist Name",
        coverArtImagePath: "assets/images/cover.jpg",
        audioPath: "audio/song.mp3"
    ),
    // Add more songs...
];
```

2. Playing a Song:

```dart
// Navigate to song screen and play
void goToSongScreen(int songIndex) {
    songListProvider.currentSongIndex = songIndex;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const SongScreen(),
        ));
}
```

## Troubleshooting

Common issues and solutions:

1. **Audio not playing:**
   - Verify audio files are correctly placed in assets
   - Check file paths in song list
   - Ensure audio permissions are granted

2. **Assets not found:**
   - Run `flutter clean`
   - Verify `pubspec.yaml` asset declarations
   - Check for correct file paths

3. **UI not updating:**
   - Verify `notifyListeners()` is called when state changes
   - Check Provider implementation in widget tree

## Contributing

Feel free to submit issues and enhancement requests!

1. Fork the repo
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## Acknowledgments

- Flutter team for the amazing framework
- audioplayers package maintainers
- Provider package maintainers
