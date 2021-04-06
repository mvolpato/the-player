/*
 * File: audio_player_service.dart
 * Project: Flutter music player
 * Created Date: Monday April 5th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:music_player/domain/playlists/playlist_item.dart';

/// Enumerates the different processing states of a player.
enum AudioProcessingState {
  /// The player has not loaded an audio source.
  idle,

  /// The player is loading an audio source.
  loading,

  /// The player is buffering audio and unable to play.
  buffering,

  /// The player has enough audio buffered and is able to play.
  ready,

  /// The player is ready and playing.
  playing,

  /// The player has reached the end of the audio.
  completed,

  /// The status is unknown.
  unknown,
}

/// An enumeration of modes representing the loop status.
enum PlaylistLoopMode {
  /// No audio is looping.
  off,

  /// Looping the current audio.
  one,

  /// Looping the current playlist.
  all,
}

abstract class AudioPlayerService {
  /// Whether the player is playing any audio.
  Stream<bool> get isPlaying;

  /// Whether shuffle mode is currently enabled.
  Stream<bool> get shuffleModeEnabled;

  /// The current [AudioProcessingState] of the player.
  Stream<AudioProcessingState> get audioProcessingState;

  /// Which loop mode is currently active in the player.
  Stream<PlaylistLoopMode> get loopMode;

  /// Whether there is a previous audio in the playlist.
  ///
  /// Note: this account for shuffle and repeat modes.
  bool get hasPrevious;

  /// Whether there is a next audio in the playlist.
  ///
  /// Note: this account for shuffle and repeat modes.
  bool get hasNext;

  /// The current playlist of item.
  ///
  /// Note: this does not change with shuffle and repeat mode.
  Stream<List<PlaylistItem>?> get currentPlaylist;

  /// Skip to the previous audio in the playlist, if any.
  Future<void> seekToPrevious();

  /// Skip to the next audio in the playlist, if any.
  Future<void> seekToNext();

  /// Set a specific loop mode.
  Future<void> setLoopMode(PlaylistLoopMode mode);

  /// Set whether the shuffle mode is enabled.
  Future<void> setShuffleModeEnabled(bool enabled);

  /// Pause the player.
  Future<void> pause();

  /// Start playing from the item previously seeked to,
  /// or the first item if no seek was previously done.
  Future<void> play();

  /// Move to the start of the playlist.
  Future<void> seekToStart();

  /// Move to the `index` item in the playlist.
  Future<void> seekToIndex(int index);

  /// Load a playlist.
  ///
  /// Note: this is needed before playing any item.
  Future<Duration?> loadPlaylist(List<PlaylistItem> playlist);
}
