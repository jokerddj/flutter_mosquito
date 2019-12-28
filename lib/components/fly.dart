import 'dart:developer';
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter_mosquito/mosquito_game.dart';

class Fly {
  final MosquitoGame game;
  Rect flyRect;
  bool isDead = false;
  bool isOffScreen = false;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;
  Offset targetLocation;

  double get speed => game.tileSize * 3;

  void setTargetLocation() {
    double x = game.rnd.nextDouble() * (game.screenSize.width - (game.tileSize * 2.025));
    double y = game.rnd.nextDouble() * (game.screenSize.height - (game.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }

  Fly(this.game) {
    setTargetLocation();
  }

  void render(Canvas canvas) {
    if (isDead) {
      deadSprite.renderRect(canvas, flyRect.inflate(2));
    } else {
      if (flyingSpriteIndex.toInt() < 0 || flyingSpriteIndex.toInt() > 1) {
        print("index[${flyingSpriteIndex.toInt()}]");
        flyingSpriteIndex = 0;
      }
      flyingSprite[flyingSpriteIndex.toInt()]?.renderRect(canvas, flyRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      //蚊子被击落
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      if (flyRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    } else {
      //未被击落
      flyingSpriteIndex += 30 * t;
      while (flyingSpriteIndex >= 2) {
        flyingSpriteIndex -= 2;
      }
      //进行移动的距离
      double stepDistance = speed * t;
      //目标距离相差Offset
      Offset toTarget = targetLocation - Offset(flyRect.left, flyRect.top);
      //比较移动的距离和相差的距离
      if (stepDistance<toTarget.distance ) {
        //未到达目标距离
        Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
        flyRect = flyRect.shift(stepToTarget);
      } else {
        flyRect = flyRect.shift(toTarget);
        setTargetLocation();
      }
    }
  }

  void onTapDown() {
    isDead = true;
  }
}
