// ignore_for_file: public_member_api_docs

import 'package:banana_fly/banana_fly.dart';
import 'package:flame_lottie/flame_lottie.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({required this.game, super.key});
  final MmxpFlameGame game;

  @override
  Widget build(BuildContext context) => Material(
        color: Color.fromARGB(213, 0, 255, 255),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('packages/banana_fly/gameassets/images/gameover.json', width: 200),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${game.monkey.score}',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: const Text(
                  'RESTART',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
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
