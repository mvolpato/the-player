/*
 * File: main.dart
 * Project: Flutter music player
 * Created Date: Tuesday February 16th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:flutter/material.dart';
import 'package:music_player/screens/player.dart';
import 'package:music_player/services/playlists/hardcoded_playlists_service.dart';
import 'package:music_player/services/playlists/playlists_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider<PlaylistsService>(
          create: (_) {
            return HardcodedPlaylistsService();
          },
          child: Player()),
    );
  }
}
