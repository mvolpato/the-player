/*
 * File: main.dart
 * Project: Flutter music player
 * Created Date: Tuesday February 16th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:flutter/material.dart';
import 'package:music_player/screens/category_selector.dart';
import 'package:music_player/services/audio/audio_player_service.dart';
import 'package:music_player/services/audio/just_audio_player.dart';
import 'package:music_player/services/playlists/hardcoded_playlists_service.dart';
import 'package:music_player/services/playlists/playlists_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PlaylistsService>(
          create: (_) => HardcodedPlaylistsService(),
        ),
        Provider<AudioPlayerService>(
          create: (_) => JustAudioPlayer(),
          dispose: (_, value) {
            (value as JustAudioPlayer).dispose();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CategorySelector(),
      ),
    );
  }
}
