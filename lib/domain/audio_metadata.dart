/*
 * File: audio_metadata.dart
 * Project: Flutter music player
 * Created Date: Thursday February 18th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

/// Represents information about an audio source.
class AudioMetadata {
  /// The name of the song/show/recording.
  final String title;

  /// URL to an image representing this audio source.
  final String artwork;

  AudioMetadata({this.title, this.artwork});
}
