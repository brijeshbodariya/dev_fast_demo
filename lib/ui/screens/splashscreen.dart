import 'dart:async';

import 'package:dev_fast_demo/constant/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  VideoPlayerController? playerController;
  VoidCallback? listener;

  @override
  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
    initializeVideo();
    playerController!.play();

    startTime();
  }

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    playerController!.setVolume(0.0);
    playerController!.removeListener(listener!);
    if (kDebugMode) {
      print('navigation');
    }

    Navigator.of(context).pushReplacementNamed(homeScreen);
  }

  void initializeVideo() {
    playerController =
        VideoPlayerController.asset("assets/video/splashvideo1.mp4")
          ..addListener(listener!)
          ..setVolume(0.0)
          ..initialize()
          ..play();
  }

  @override
  void deactivate() {
    if (playerController != null) {
      playerController!.setVolume(0.0);
      playerController!.removeListener(listener!);
    }
    super.deactivate();
  }

  @override
  void dispose() {
    if (playerController != null) playerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(fit: StackFit.expand, children: <Widget>[
          AspectRatio(
              aspectRatio: 9 / 16,
              child: Container(
                child: (playerController != null
                    ? VideoPlayer(playerController!)
                    : Container()),
              )),
        ]));
  }
}
