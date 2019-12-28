import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mosquito/mosquito_game.dart';

class BackYard {
  final MosquitoGame game;
  Sprite bgSprite;
  Rect bgRect;

  BackYard(this.game) {
    bgSprite = Sprite("bg/backyard.png");

    //游戏区为 9*23个大小
    bgRect = Rect.fromLTWH(0, game.screenSize.height - game.tileSize * 23, game.tileSize * 9, game.tileSize * 23);
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}
