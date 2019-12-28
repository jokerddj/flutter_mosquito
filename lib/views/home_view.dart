import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_mosquito/mosquito_game.dart';

class HomeView extends Game {
  final MosquitoGame game;
  Rect titleRect;
  Sprite titleSprite;
  
  HomeView(this.game){
   titleRect=Rect.fromLTWH(game.tileSize, (game.screenSize.height/2)-(game.tileSize*4), game.tileSize*7, game.tileSize*4);
   titleSprite=Sprite("branding/title.png");
  }

  @override
  void render(Canvas canvas) {
    titleSprite.renderRect(canvas,titleRect);
    // TODO: implement render
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}
