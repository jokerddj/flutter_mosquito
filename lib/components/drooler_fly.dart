
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:flutter_mosquito/components/fly.dart';
import 'package:flutter_mosquito/mosquito_game.dart';

class DroolerFly extends Fly{
  DroolerFly(MosquitoGame game, double x, double y) : super(game){
    flyRect=Rect.fromLTWH(x, y, 1.5*game.tileSize, 1.5*game.tileSize);
    flyingSprite = <Sprite>[Sprite("flies/drooler-fly-1.png"), Sprite("flies/drooler-fly-2.png")];
    deadSprite = Sprite("flies/drooler-fly-dead.png");

  }

  @override
  double get speed =>game.tileSize*1.5;
}