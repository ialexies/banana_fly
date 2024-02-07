import 'package:banana_fly/banana_fly.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  final MmxpFlameGame game;
  static const String id = 'mainMenu';

  const MainMenuScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              // image: AssetImage(Assets.menu),
              image: AssetImage('packages/banana_fly/gameassets/images/${Assets.menu}'),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset('packages/banana_fly/gameassets/images/${Assets.message}'),
        ),
      ),
    );
  }
}
