/*
 * File: playlists_service.dart
 * Project: Flutter music player
 * Created Date: Sunday March 28th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:music_player/domain/playlists/author.dart';
import 'package:music_player/domain/playlists/playlist_item.dart';

abstract class PlaylistsService {
  List<PlaylistItem> get allItems;
  Map<String, List<PlaylistItem>> get playlists;
  Map<Author, List<PlaylistItem>> get itemsByAuthor;
}
