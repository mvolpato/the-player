/*
 * File: player.dart
 * Project: Flutter music player
 * Created Date: Wednesday February 17th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/domain/audio_metadata.dart';
import 'package:music_player/screens/commons/player_buttons.dart';
import 'package:music_player/screens/commons/playlist.dart';

/// An audio player.
///
/// At the bottom of the page there is [PlayerButtons], while the rest of the
/// page is filled with a [PLaylist] widget.
class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Hardcoded audio sources
    // TODO: Get sources with a network call, or at least move to a separated file.
    _audioPlayer
        .setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse(
                "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3"),
            tag: AudioMetadata(
              title: "Tristram",
              artwork:
                  "https://upload.wikimedia.org/wikipedia/en/3/3a/Diablo_Coverart.png",
            ),
          ),
          AudioSource.uri(
            Uri.parse(
                "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3"),
            tag: AudioMetadata(
              title: "Cerulean City",
              artwork:
                  "https://upload.wikimedia.org/wikipedia/en/f/f1/Bulbasaur_pokemon_red.png",
            ),
          ),
          AudioSource.uri(
            Uri.parse(
                "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3"),
            tag: AudioMetadata(
              title: "The secret of Monkey Island - Introduction",
              artwork:
                  "https://upload.wikimedia.org/wikipedia/en/a/a8/The_Secret_of_Monkey_Island_artwork.jpg",
            ),
          ),
        ],
      ),
    )
        .catchError((error) {
      // catch load errors: 404, invalid url ...
      print("An error occured $error");
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(child: Playlist(_audioPlayer)),
              PlayerButtons(_audioPlayer),
            ],
          ),
        ),
      ),
    );
  }
}
