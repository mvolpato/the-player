/*
 * File: author.dart
 * Project: Flutter music player
 * Created Date: Sunday March 28th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

/// The author of an audio. The host of a podcast or the artist
/// of a song.
class Author {
  /// Name of the author.
  final String name;

  /// An Uri to an image representing this author.
  final Uri? image;

  Author(this.name, this.image);
}
