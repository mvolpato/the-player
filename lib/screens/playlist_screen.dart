/*
 * File: playlist_screen.dart
 * Project: Flutter music player
 * Created Date: Monday April 5th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:flutter/material.dart';
import 'package:music_player/domain/playlists/playlist_item.dart';
import 'package:music_player/screens/commons/playlist.dart';
import 'package:music_player/screens/commons/player_buttons_container.dart';

/// A screen with a playlist.
class PlaylistScreen extends StatelessWidget {
  final List<PlaylistItem> _playlist;

  PlaylistScreen(this._playlist, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: PlayerButtonsContainer(
            child: Playlist(_playlist),
          ),
        ),
      ),
    );
  }
}
