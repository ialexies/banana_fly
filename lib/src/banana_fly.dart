// ignore_for_file: public_member_api_docs

import 'package:banana_fly/banana_fly.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

/// {@template banana_fly}
/// banana flying game of mmxp
/// {@endtemplate}
class BananaFly {
  /// {@macro banana_fly}
  const BananaFly();
}

class BananaFlyGame extends StatefulWidget {
  BananaFlyGame({super.key});

  @override
  State<BananaFlyGame> createState() => _BananaFlyGameState();
}

class _BananaFlyGameState extends State<BananaFlyGame> {
  final game = MmxpFlameGame();

  @override
  void initState() {
    super.initState();

    // set custom prefix for assets
    // game.images.prefix = 'gameassets/images/';
    game.images.prefix = 'packages/banana_fly/gameassets/images/';
    // game.prefix = 'gameassets/';
    // update flame audio updatePrefix
    // FlameAudio.audioCache.prefix = 'gameassets/audio/';
    FlameAudio.audioCache.prefix = 'packages/banana_fly/gameassets/audio/';
  }

  @override
  Widget build(BuildContext context) {
    // game.images.prefix = 'game_assets/images/';

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
