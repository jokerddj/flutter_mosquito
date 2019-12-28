import 'package:flutter_mosquito/mosquito_game.dart';

class FlyProducer {
  final MosquitoGame game;
  final int maxProducerInterval = 3000;
  final int minProducerInterval = 200;
  final int intervalChange = 3;
  final int maxProducerOnScreen = 7;
  int currentInterval;
  int nextProducer;

  FlyProducer(this.game) {
    //
    start();
    game.produceFly();
  }

  void start() {
    killAll();
    currentInterval = maxProducerInterval;
    nextProducer = DateTime.now().millisecondsSinceEpoch + currentInterval;

  }

  void killAll() {
    game.enemys.forEach((fly) => fly.isDead = true);

  }

  void update(double t) {
    int nowTimestamp =DateTime.now().millisecondsSinceEpoch;
    int livingFly=0;
    game.enemys.forEach((fly){
      if(!fly.isDead){
        livingFly+=1;
      }
    });

  if(nowTimestamp>=nextProducer&&livingFly<maxProducerOnScreen){
    game.produceFly();
    //修改蚊子产生速度
    if(currentInterval>minProducerInterval){
      currentInterval-=intervalChange;
      currentInterval-=(currentInterval*0.2).toInt();
    }
    nextProducer=nowTimestamp+currentInterval;

  }

  }
}
