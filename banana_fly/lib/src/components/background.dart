// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:banana_fly/banana_fly.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Background extends SpriteComponent with HasGameRef<MmxpFlameGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.bg_destinations);

    size = gameRef.size;
    sprite = Sprite(background);
  }
}
