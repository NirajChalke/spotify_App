import 'package:spotify_app/models/Music.dart';

class MusicOperation {
  MusicOperation._() {}
  static List<Music> getmusic() {
    return <Music>[
      Music(
          "https://i.scdn.co/image/ab67706f00000002131fa1b6957d14834e19ca65",
          "Desi Hip Hop",
          "KRSNA,DIVINE,RAFTAAR....",
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/0f/91/d0/0f91d09d-2e30-68cc-2b70-0e915ce4e4af/mzaf_15588087331750373349.plus.aac.p.m4a"),
      Music(
          "https://i.scdn.co/image/ab67616d0000b2731a8c4618eda885a406958dd0",
          "Shub",
          "Top 10 Most Played",
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview126/v4/6f/5f/df/6f5fdfc3-1333-7ee5-5fc9-c8049fda8837/mzaf_2970804626822568035.plus.aac.p.m4a"),
      Music(
          "https://i.scdn.co/image/ab67706f000000028ff7a05bafaf22c95d0e4dc4",
          "Indie India",
          "Best of Indie India 2023",
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview126/v4/e2/30/e0/e230e05d-60ef-fc2b-ff6c-846005f43be8/mzaf_973337519376506060.plus.aac.p.m4a"),
      Music(
          "https://i.scdn.co/image/ab67706f00000002b0c066c63921e8d43068982c",
          "Taylor Swift",
          "Best of Taylor Swift",
          "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview116/v4/96/46/c6/9646c620-866e-064b-911f-4abfb30b21c7/mzaf_9535452979747763612.plus.aac.p.m4a"),
    ];
  }
}
