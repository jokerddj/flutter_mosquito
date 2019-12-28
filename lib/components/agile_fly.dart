
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter_mosquito/components/fly.dart';
import 'package:flutter_mosquito/mosquito_game.dart';

class AgileFly extends Fly{
  AgileFly(MosquitoGame game, double x, double y) : super(game){
    flyRect=Rect.fromLTWH(x, y, 1.5*game.tileSize, 1.5*game.tileSize);
    flyingSprite = <Sprite>[Sprite("flies/agile-fly-1.png"), Sprite("flies/agile-fly-2.png")];
    deadSprite = Sprite("flies/agile-fly-dead.png");

  }

  @override
  double get speed =>game.tileSize*5;
}