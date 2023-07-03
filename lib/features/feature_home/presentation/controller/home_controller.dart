import 'dart:async';
import 'package:get/get.dart';
import 'package:rock_paper_scissors/features/feature_home/domain/enums/direction.dart';

class HomeController extends GetxController{
  RxDouble containerY = 0.0.obs;
  RxDouble containerX = 0.0.obs;
  RxDouble containerYIncrement = 0.007.obs;
  RxDouble containerXIncrement = 0.007.obs;

  RxBool hasGameStarted = false.obs;
  RxBool isGameOver = false.obs;

  RxBool loading = false.obs;
  var ballYDirection = direction.DOWN;
  var ballXDirection = direction.LEFT;
  void startGame() {
    hasGameStarted.value = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      // update direction
      updateDirection();

      // move Container
      moveContainers();

      // check if container dead
      if(isContainerDead()){
        timer.cancel();
        isGameOver.value = true;
      }
    });
  }

  void moveContainers() {
    if(ballYDirection == direction.DOWN){
      containerY.value += containerYIncrement.value;
    } else if(ballYDirection == direction.UP){
      containerY.value -= containerYIncrement.value;
    }

    if(ballXDirection == direction.LEFT){
      containerX.value -= containerXIncrement.value;
    } else if(ballXDirection == direction.RIGHT){
      containerX.value += containerXIncrement.value;
    }
  }

  void updateDirection() {
    if (containerY >= 1.0) {
      ballYDirection = direction.UP;
    } else if (containerY <= -1.0) {
      ballYDirection = direction.DOWN;
    }
    if (containerX >= 0.95) {
      ballXDirection = direction.LEFT;
    } else if (containerX <= -0.95) {
      ballXDirection = direction.RIGHT;
    }
  }

  bool isContainerDead() {
    if (containerY <= -1.5){
      return true;
    }
    return false;
  }
}