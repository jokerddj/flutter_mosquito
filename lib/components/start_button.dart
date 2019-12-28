import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mosquito/common/view.dart';
import 'package:flutter_mosquito/mosquito_game.dart';

class StartButton extends Game {
  final MosquitoGame game;
  Sprite buttonSprite;
  Rect buttonRect;

  StartButton(this.game) {
    buttonRect = Rect.fromLTWH(
      game.tileSize * 1.5,
      (game.screenSize.height * .75) - (game.tileSize * 1.5),
      game.tileSize * 6,
      game.tileSize * 3,
    );
    buttonSprite = Sprite('ui/start-button.png');
  }

  void onTapDown() {
    game.producer.start();
    game.activeView = View.playing;
  }

  @override
  void render(Canvas canvas) {
    buttonSprite.renderRect(canvas, buttonRect);
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}
