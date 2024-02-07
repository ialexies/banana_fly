// ignore_for_file: public_member_api_docs

import 'package:banana_fly/banana_fly.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';

import 'package:flutter/painting.dart';

class MmxpFlameGame extends FlameGame with TapDetector, HasCollisionDetection {
  MmxpFlameGame();
  // await Flame.device.fullScreen();
  late Monkey monkey; // await Flame.device.fullScreen();
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;
  @override
  Future<void> onLoad() async {
    images.prefix = 'packages/banana_fly/gameassets/images/';
    FlameAudio.audioCache.prefix = 'packages/banana_fly/gameassets/audio/';
    await addAll([
      Background(),
      monkey = Monkey(),
      Clouds(),
      Ground(),
      score = buildScore(),
    ]);

    interval.onTick = () => addAll([
          PipeGroup(),
        ]);
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
    monkey.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${monkey.score}';
  }

  // override render
  // add ground on top of PipeGroup
  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  static void addListener(Null Function() param0) {}
}
