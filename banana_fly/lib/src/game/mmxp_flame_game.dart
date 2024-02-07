// ignore_for_file: public_member_api_docs

import 'package:banana_fly/banana_fly.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_lottie/flame_lottie.dart';

import 'package:flutter/painting.dart';

class MmxpFlameGame extends FlameGame with TapDetector, HasCollisionDetection {
  MmxpFlameGame();

  late Monkey monkey;
  late PipeGroup pipeGroup;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  TextComponent score = TextComponent(text: '0');

  @override
  Future<void> onLoad() async {
    images.prefix = 'packages/banana_fly/gameassets/images/';
    FlameAudio.audioCache.prefix = 'packages/banana_fly/gameassets/audio/';
    final asset = Lottie.asset('packages/banana_fly/gameassets/images/backanimation.json');
    final animation = await loadLottie(asset);
    add(
      LottieComponent(
        animation,
        repeating: true, // Continuously loop the animation.
        size: Vector2(size.x, size.y),
        fit: BoxFit.fill,
      ),
    );
    await addAll([
      monkey = Monkey(),
      Clouds(),
      Ground(),
      score = buildScore(),
    ]);

    interval.onTick = () => addAll([
          pipeGroup = PipeGroup(),
        ]);
  }

  TextComponent buildScore() {
    return TextComponent(
      position: Vector2(size.x / 2, (size.y / 2 * 0.2) + 100),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 80,
          fontFamily: 'Game',
          // color transparent white
          color: Color.fromARGB(83, 255, 255, 255),
          fontWeight: FontWeight.w800,
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
    score.text = '${monkey.score}';
  }

  // override render
  // add ground on top of PipeGroup
  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
