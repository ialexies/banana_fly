// ignore_for_file: public_member_api_docs

import 'package:banana_fly/banana_fly.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';

class Clouds extends ParallaxComponent<MmxpFlameGame> with HasGameRef<MmxpFlameGame> {
  Clouds();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load(Assets.clouds);
    position = Vector2(x, -(gameRef.size.y - Config.cloudsHeight));
    // position = Vector2(x, 500);
    height = 1500;
    // width = 900;
    // size = Vector2(gameRef.size.x, Config.cloudsHeight);

    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(image, fill: LayerFill.none),
      ),
    ], size: Vector2(gameRef.size.x, Config.cloudsHeight));
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }

  @override
  void render(Canvas canvas) {
    parallax?.render(canvas);
    super.render(canvas);
  }
}
