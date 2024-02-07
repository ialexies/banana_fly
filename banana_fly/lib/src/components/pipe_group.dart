// ignore_for_file: public_member_api_docs

import 'dart:math';
import 'package:banana_fly/banana_fly.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

class PipeGroup extends PositionComponent with HasGameRef<MmxpFlameGame> {
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 120 + _random.nextDouble() * (heightMinusGround / 4);
    // final spacing = 500;
    // ignore: lines_longer_than_80_chars
    final centerY = spacing + _random.nextDouble() * (heightMinusGround - spacing);

    await addAll([
      Pipe(
        pipePosition: PipePosition.top,
        height: centerY - (spacing / 2) - 30,
      ),
      Pipe(
        pipePosition: PipePosition.bottom,
        height: heightMinusGround - (centerY + spacing / 2) - 30,
      ),
    ]);
  }

  void updateScore() {
    gameRef.monkey.score += 1;
    FlameAudio.play(Assets.point);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= (Config.gameSpeed) * dt;

    if (position.x < -10) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }
}
