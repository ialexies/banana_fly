import 'dart:async';

import 'package:banana_fly/banana_fly.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Background extends SpriteComponent with HasGameRef<MmxpFlameGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.backgorund);

    size = gameRef.size;
    sprite = Sprite(background);
  }
}
