/*
 * File: playlist_item.dart
 * Project: Flutter music player
 * Created Date: Sunday March 28th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:music_player/domain/playlists/author.dart';

class PlaylistItem {
  final Author author;
  final String title;
  final Uri? artworkUri;
  final Uri itemLocation;

  PlaylistItem(
    this.author,
    this.title,
    this.artworkUri,
    this.itemLocation,
  );
}
