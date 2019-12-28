import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_mosquito/mosquito_game.dart';

class LostView extends Game {
  final MosquitoGame game;
  Rect lostRect;
  Sprite lostSprite;

  LostView(this.game) {
    lostRect = Rect.fromLTWH(
      game.tileSize,
      (game.screenSize.height / 2) - (game.tileSize * 5),
      game.tileSize * 7,
      game.tileSize * 5,
    );
    lostSprite = Sprite('bg/lose-splash.png');
  }

  @override
  void render(Canvas canvas) {
    lostSprite.renderRect(canvas, lostRect);
    // TODO: implement render
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}
