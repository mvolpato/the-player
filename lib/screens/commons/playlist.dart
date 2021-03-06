/*
 * File: playlist.dart
 * Project: Flutter music player
 * Created Date: Thursday February 18th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Playlist extends StatelessWidget {
  const Playlist(this._audioPlayer, {Key key}) : super(key: key);

  final AudioPlayer _audioPlayer;

  Widget build(BuildContext context) {
    return StreamBuilder<SequenceState>(
      stream: _audioPlayer.sequenceStateStream,
      builder: (context, snapshot) {
        final state = snapshot.data;
        final sequence = state?.sequence ?? [];
        return ListView(
          children: [
            for (var i = 0; i < sequence.length; i++)
              Material(
                color: i == state.currentIndex
                    ? Theme.of(context).accentColor
                    : null,
                child: ListTile(
                  leading: Image.network(sequence[i].tag.artwork),
                  title: Text(sequence[i].tag.title),
                  onTap: () {
                    _audioPlayer.seek(Duration.zero, index: i);
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
