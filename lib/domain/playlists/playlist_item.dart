/*
 * File: playlist_item.dart
 * Project: Flutter music player
 * Created Date: Sunday March 28th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:music_player/domain/playlists/author.dart';

/// An audio item
class PlaylistItem {
  /// The [Author] of this audio item.
  final Author author;

  /// The title of this audio item.
  final String title;

  /// The Uri to an image representing this audio item.
  final Uri? artworkUri;

  /// An Uri at which the audio can be found.
  final Uri itemLocation;

  PlaylistItem(
    this.author,
    this.title,
    this.artworkUri,
    this.itemLocation,
  );
}
