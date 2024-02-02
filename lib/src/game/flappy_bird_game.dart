import 'package:banana_fly/banana_fly.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'package:flutter/painting.dart';

class MmxpFlameGame extends FlameGame with TapDetector, HasCollisionDetection {
  MmxpFlameGame();
  // await Flame.device.fullScreen();
  late Bird bird; // await Flame.device.fullScreen();
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;
  @override
  Future<void> onLoad() async {
    await addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          fontFamily: 'Game',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  void onTap() {
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';
  }
}
