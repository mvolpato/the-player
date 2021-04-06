/*
 * File: category_selector.dart
 * Project: Flutter music player
 * Created Date: Monday March 29th 2021
 * Author: Michele Volpato
 * -----
 * Copyright (c) 2021 Michele Volpato
 */

import 'package:flutter/material.dart';
import 'package:music_player/screens/commons/player_buttons_container.dart';
import 'package:music_player/screens/playlist_screen.dart';
import 'package:music_player/services/playlists/playlists_service.dart';
import 'package:provider/provider.dart';

/// A selector screen for categories of audio.
///
/// Current categories are:
///  - all items;
class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: PlayerButtonsContainer(
            child: Consumer<PlaylistsService>(
              builder: (__, value, _) {
                return Column(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          title: Text("All items"),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PlaylistScreen(value.allItems),
                              ),
                            );
                          },
                        ),
                      ]..addAll(
                          value.playlists.keys.map((playlistName) {
                            return ListTile(
                              title: Text(playlistName),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PlaylistScreen(
                                        value.playlists[playlistName]!),
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
