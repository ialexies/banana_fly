// ignore_for_file: public_member_api_docs

import 'package:banana_fly/banana_fly.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Pipe extends SpriteComponent with HasGameRef<MmxpFlameGame> {
  Pipe({
    required this.pipePosition,
    required this.height,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(Config.pipeWidth, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y;
        sprite = Sprite(pipe);
    }

    add(RectangleHitbox());
  }
}
