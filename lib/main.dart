import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mosquito/mosquito_game.dart';

void main() async {
  Util flameUtil = Util();
  //设置全屏
  await flameUtil.fullScreen();
  //  设置屏幕方向
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  //加载资源
  Flame.images.loadAll(<String>[
    //背景
    'bg/backyard.png',
    //蚊子素材
    'flies/agile-fly-1.png',
    'flies/agile-fly-2.png',
    'flies/agile-fly-dead.png',
    'flies/drooler-fly-1.png',
    'flies/drooler-fly-2.png',
    'flies/drooler-fly-dead.png',
    'flies/mosquito-fly-1.png',
    'flies/mosquito-fly-2.png',
    'flies/mosquito-fly-dead.png',
    'flies/hungry-fly-1.png',
    'flies/hungry-fly-2.png',
    'flies/hungry-fly-dead.png',
    'flies/macho-fly-1.png',
    'flies/macho-fly-2.png',
    'flies/macho-fly-dead.png',
    //开始页素材
    'bg/lose-splash.png',
    'branding/title.png',
    'ui/dialog-credits.png',
    'ui/dialog-help.png',
    'ui/icon-credits.png',
    'ui/icon-help.png',
    'ui/start-button.png',
  ]);
  //加载声音资源
  Flame.audio.loadAll(<String>[
    'sounds/bgm.mp3',
    'sounds/kill.wav',
  ]);

  MosquitoGame game = MosquitoGame();

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  runApp(game.widget);
  flameUtil.addGestureRecognizer(tapper);
}
