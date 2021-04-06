/*
 * File: player_buttons.dart
 * Project: Flutter music player
 * Created Date: Thursday February 18th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:flutter/material.dart';
import 'package:music_player/domain/playlists/playlist_item.dart';
import 'package:music_player/services/audio/audio_player_service.dart';
import 'package:provider/provider.dart';

/// A `Row` of buttons that interact with audio.
///
/// The order is: shuffle, previous, play/pause/restart, next, repeat.
class PlayerButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerService>(builder: (_, player, __) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Shuffle
          StreamBuilder<bool>(
            stream: player.shuffleModeEnabled,
            builder: (context, snapshot) {
              return _shuffleButton(context, snapshot.data ?? false, player);
            },
          ),
          // Previous
          StreamBuilder<List<PlaylistItem>?>(
            stream: player.currentPlaylist,
            builder: (_, __) {
              return _previousButton(player);
            },
          ),
          // Play/pause/restart
          StreamBuilder<AudioProcessingState>(
            stream: player.audioProcessingState,
            builder: (_, snapshot) {
              final playerState = snapshot.data ?? AudioProcessingState.unknown;
              return _playPauseButton(playerState, player);
            },
          ),
          // Next
          StreamBuilder<List<PlaylistItem>?>(
            stream: player.currentPlaylist,
            builder: (_, __) {
              return _nextButton(player);
            },
          ),
          // Repeat
          StreamBuilder<PlaylistLoopMode>(
            stream: player.loopMode,
            builder: (context, snapshot) {
              return _repeatButton(
                  context, snapshot.data ?? PlaylistLoopMode.off, player);
            },
          ),
        ],
      );
    });
  }

  /// A button that plays or pauses the audio.
  ///
  /// If the audio is playing, a pause button is shown.
  /// If the audio has finished playing, a restart button is shown.
  /// If the audio is paused, or not started yet, a play button is shown.
  /// If the audio is loading, a progress indicator is shown.
  Widget _playPauseButton(
      AudioProcessingState processingState, AudioPlayerService player) {
    if (processingState == AudioProcessingState.loading ||
        processingState == AudioProcessingState.buffering) {
      return Container(
        margin: EdgeInsets.all(8.0),
        width: 64.0,
        height: 64.0,
        child: CircularProgressIndicator(),
      );
    } else if (processingState == AudioProcessingState.ready) {
      return IconButton(
        icon: Icon(Icons.play_arrow),
        iconSize: 64.0,
        onPressed: player.play,
      );
    } else if (processingState != AudioProcessingState.completed) {
      return IconButton(
        icon: Icon(Icons.pause),
        iconSize: 64.0,
        onPressed: player.pause,
      );
    } else {
      return IconButton(
        icon: Icon(Icons.replay),
        iconSize: 64.0,
        onPressed: () => player.seekToStart(),
      );
    }
  }

  /// A shuffle button. Tapping it will either enabled or disable shuffle mode.
  Widget _shuffleButton(
      BuildContext context, bool isEnabled, AudioPlayerService player) {
    return IconButton(
      icon: isEnabled
          ? Icon(Icons.shuffle, color: Theme.of(context).accentColor)
          : Icon(Icons.shuffle),
      onPressed: () async {
        final enable = !isEnabled;
        await player.setShuffleModeEnabled(enable);
      },
    );
  }

  /// A previous button. Tapping it will seek to the previous audio in the list.
  Widget _previousButton(AudioPlayerService player) {
    return IconButton(
      icon: Icon(Icons.skip_previous),
      onPressed: player.hasPrevious ? player.seekToPrevious : null,
    );
  }

  /// A next button. Tapping it will seek to the next audio in the list.
  Widget _nextButton(AudioPlayerService player) {
    return IconButton(
      icon: Icon(Icons.skip_next),
      onPressed: player.hasNext ? player.seekToNext : null,
    );
  }

  /// A repeat button. Tapping it will cycle through not repeating, repeating
  /// the entire list, or repeat the current audio.
  Widget _repeatButton(BuildContext context, PlaylistLoopMode loopMode,
      AudioPlayerService player) {
    final icons = [
      Icon(Icons.repeat),
      Icon(Icons.repeat, color: Theme.of(context).accentColor),
      Icon(Icons.repeat_one, color: Theme.of(context).accentColor),
    ];
    const cycleModes = [
      PlaylistLoopMode.off,
      PlaylistLoopMode.all,
      PlaylistLoopMode.one,
    ];
    final index = cycleModes.indexOf(loopMode);
    return IconButton(
      icon: icons[index],
      onPressed: () {
        player.setLoopMode(
            cycleModes[(cycleModes.indexOf(loopMode) + 1) % cycleModes.length]);
      },
    );
  }
}
