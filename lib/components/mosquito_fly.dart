import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mosquito/components/fly.dart';
import 'package:flutter_mosquito/mosquito_game.dart';

class MosquitoFly extends Fly {
  //  mosquito-fly	正常蚊子	1.0x
  //  agile-fly	敏捷蚊子	1.0x
  //  drooler-fly	懒惰蚊子	1.0x
  //  hungry-fly	饥饿蚊子	1.1x
  //  macho-fly	猛男蚊子	1.35x
  MosquitoFly(MosquitoGame game, double x, double y) : super(game) {
    flyRect=Rect.fromLTWH(x, y, 1.5*game.tileSize, 1.5*game.tileSize);
    flyingSprite = <Sprite>[Sprite("flies/mosquito-fly-1.png"), Sprite("flies/mosquito-fly-2.png")];
    deadSprite = Sprite("flies/mosquito-fly-dead.png");
  }

}
