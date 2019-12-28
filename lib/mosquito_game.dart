import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mosquito/common/view.dart';
import 'package:flutter_mosquito/components/agile_fly.dart';
import 'package:flutter_mosquito/components/back_yard.dart';
import 'package:flutter_mosquito/components/drooler_fly.dart';
import 'package:flutter_mosquito/components/hungry_fly.dart';
import 'package:flutter_mosquito/components/macho_fly.dart';
import 'package:flutter_mosquito/components/mosquito_fly.dart';
import 'package:flutter_mosquito/components/start_button.dart';
import 'package:flutter_mosquito/controllers/producter.dart';
import 'package:flutter_mosquito/views/home_view.dart';
import 'package:flutter_mosquito/views/lost_view.dart';

import 'components/fly.dart';

class MosquitoGame extends BaseGame {
  final fpsTextConfig = TextConfig(color: Colors.green);
  View activeView = View.home;
  HomeView homeView;
  LostView lostView;
  StartButton startButton;
  Size screenSize;
  double tileSize;
  List<Fly> enemys;
  BackYard background;
  Random rnd;
  final TextConfig scoreConfig = TextConfig(color: Colors.green);
  int score = 0;
  bool debug = true;
  FlyProducer producer;

  bool debugMode() => debug;

  // 0 初始 1 正常 2 失败
  int gameState = -1;

  MosquitoGame() {
    initialize();
  }

  void initialize() async {
    enemys = List<Fly>();
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    background = BackYard(this);
    homeView = HomeView(this);
    lostView = LostView(this);
    startButton = StartButton(this);
    producer = FlyProducer(this);
    //播放背景音乐
    Flame.audio.disableLog();
    Flame.audio.loopLongAudio("sounds/bgm.mp3");
  }

  void produceFly() {
    double x = rnd.nextDouble() * (screenSize.width - 2 * tileSize);
    double y = rnd.nextDouble() * (screenSize.height - 2 * tileSize);
    switch (rnd.nextInt(5)) {
      case 0:
        enemys.add(MosquitoFly(this, x, y));
        break;
      case 1:
        enemys.add(AgileFly(this, x, y));
        break;
      case 2:
        enemys.add(DroolerFly(this, x, y));
        break;
      case 3:
        enemys.add(HungaryFly(this, x, y));
        break;
      case 4:
        enemys.add(MachoFly(this, x, y));
        break;
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = size.width / 9;
    super.resize(size);
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    background.render(canvas);
    //debug fps 显示
    if (debug) {
      fpsTextConfig.render(canvas, "FPS:${fps()?.toInt()?.toString()}", Position(screenSize.width - 100, 50));
    }
    enemys.forEach((fly) => fly.render(canvas));
    if (activeView == View.home) {
      homeView.render(canvas);
    }
    if (activeView == View.lost) {
      scoreConfig
          .withColor(Colors.black)
          .render(canvas, "你的得分：${score<0?0:score}", Position(3 * tileSize, (screenSize.height + tileSize) / 2));
      lostView.render(canvas);
    }
    if (activeView == View.playing) {
      scoreConfig.render(canvas, "分数：${score<0?0:score}", Position(tileSize, tileSize));
    }
    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
    }
  }

  @override
  void update(double t) {
    //控制器更新
    producer.update(t);
    //精灵更新
    enemys.forEach((fly) => fly.update(t));
    //移除超出屏幕的精灵
    enemys.removeWhere((fly) => fly.isOffScreen);
  }

  void onTapDown(TapDownDetails details) {
    //是否点击
    bool isHandled = false;
    if (!isHandled && startButton.buttonRect.contains(details.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandled = true;
        score=0;
      }
    }
    if (!isHandled) {
      bool didHitFly = false;
      for (var i = 0; i < enemys.length; i++) {
        if (enemys[i].flyRect.contains(details.globalPosition)) {
          //播放击杀音效
          Flame.audio.play("sounds/kill.wav");
          score+=1;
          enemys[i].onTapDown();
          isHandled = true;
          didHitFly = true;
        }
      }
      //未击落蚊子游戏结束
      if (activeView == View.playing && !didHitFly) {
        activeView = View.lost;
      }
    }
  }
}
