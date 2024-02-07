// ignore_for_file: public_member_api_docs, use_super_parameters

import 'package:banana_fly/banana_fly.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class BananaFlyGame extends StatelessWidget {
  BananaFlyGame({Key? key}) : super(key: key);
  final MmxpFlameGame game = MmxpFlameGame();
  @override
  Widget build(BuildContext context) {
    game.images.prefix = 'packages/banana_fly/gameassets/images/';
    FlameAudio.audioCache.prefix = 'packages/banana_fly/gameassets/audio/';
    return GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
      },
    );
  }
}
