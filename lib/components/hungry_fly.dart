
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter_mosquito/components/fly.dart';
import 'package:flutter_mosquito/mosquito_game.dart';

class HungaryFly extends Fly{
  HungaryFly(MosquitoGame game, double x, double y) : super(game){
    flyRect=Rect.fromLTWH(x, y, 1.1*game.tileSize, 1.1*game.tileSize);
    flyingSprite = <Sprite>[Sprite("flies/hungry-fly-1.png"), Sprite("flies/hungry-fly-2.png")];
    deadSprite = Sprite("flies/hungry-fly-dead.png");

  }

  @override
  double get speed =>game.tileSize*1.5;
}