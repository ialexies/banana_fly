// ignore_for_file: public_member_api_docs

import 'package:banana_fly/banana_fly.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({required this.game, super.key});
  final MmxpFlameGame game;

  @override
  Widget build(BuildContext context) => Material(
        color: const Color.fromARGB(193, 0, 0, 0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('packages/banana_fly/gameassets/images/${Assets.gameOver}', width: 200),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      );

  void onRestart() {
    game.monkey.reset();
    // clear all pipes
    game.removeWhere((component) => component is PipeGroup);
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
