import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/colors.dart' as color;
import 'package:video_player/video_player.dart';

class VidoeInfo extends StatefulWidget {
  const VidoeInfo({Key? key}) : super(key: key);

  @override
  State<VidoeInfo> createState() => _VidoeInfoState();
}

class _VidoeInfoState extends State<VidoeInfo> {
  List _videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;

  VideoPlayerController? _videoPlayerController;

  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        _videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _disposed = true;
    _videoPlayerController?.pause();
    _videoPlayerController?.dispose();
    _videoPlayerController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColor.gradientFirst.withOpacity(0.8),
                    color.AppColor.gradientSecond,
                  ],
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              )
            : BoxDecoration(color: color.AppColor.gradientSecond),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding:
                        const EdgeInsets.only(top: 60, right: 30.0, left: 30.0),
                    width: MediaQuery.of(context).size.width,
                    height: 300.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20.0,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20.0,
                              color: color.AppColor.secondPageIconColor,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          "Legs Toning",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: color.AppColor.secondPageTitleColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "and Gluts Workout",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: color.AppColor.secondPageTitleColor,
                          ),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 90.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    color: color.AppColor.secondPageIconColor,
                                    size: 20.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "60 min",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color:
                                          color.AppColor.secondPageTitleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Container(
                              width: 225.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    color: color.AppColor.secondPageIconColor,
                                    size: 20.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "Resistant band kettlebell",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color:
                                          color.AppColor.secondPageTitleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100.0,
                          padding: const EdgeInsets.only(
                            top: 30.0,
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_playArea == true) {
                                      _playArea = false;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20.0,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                              ),
                              Expanded(child: Container()),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.info_outline,
                                  size: 20.0,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _playView(context),
                        _videoControlView(context),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70.0),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30.0,
                        ),
                        Text(
                          "Circular 1: Legs Toning",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30.0,
                              color: color.AppColor.loopColor,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "3 steps",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: color.AppColor.setsColor,
                              ),
                            ),
                            const SizedBox(
                              width: 25.0,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 8.0,
                        ),
                        itemCount: _videoInfo.length,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                            onTap: () {
                              _onTapVideo(index);
                              setState(() {
                                if (_playArea == false) {
                                  _playArea = true;
                                }
                              });
                            },
                            child: _previewCard(index),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;

    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    final controller = _videoPlayerController;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("controller can not be initialized");
      return;
    }

    _duration ??= _videoPlayerController?.value.duration;
    var duration = _duration;
    if (duration == null) {
      return;
    }

    var position = await controller.position;
    _position = position;

    final playing = controller.value.isPlaying;

    if (playing) {
      if (_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _onTapVideo(int index) {
    final videoController =
        VideoPlayerController.network(_videoInfo[index]['videoUrl']);
    final old = _videoPlayerController;
    _videoPlayerController = videoController;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }

    setState(() {});
    videoController.initialize().then((_) {
      old?.dispose();
      _isPlayingIndex = index;
      videoController.addListener(() {
        _onControllerUpdate();
      });
      videoController.play();
      setState(() {});
    });
  }

  Widget _previewCard(int index) {
    return Container(
      height: 135.0,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(
                      _videoInfo[index]['thumbnail'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _videoInfo[index]['title'],
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    _videoInfo[index]['time'],
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 18.0,
          ),
          Row(
            children: [
              Container(
                width: 80.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            width: 3.0,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFF839fed),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          )
                        : Container(
                            width: 3.0,
                            height: 1.0,
                            color: Colors.white,
                          )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _playView(BuildContext context) {
    final videoController = _videoPlayerController;
    if (videoController != null && videoController.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(_videoPlayerController!),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            "Preparing..",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white60,
            ),
          ),
        ),
      );
    }
  }

  String converTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _videoControlView(BuildContext context) {
    final noMute = (_videoPlayerController?.value.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = converTwo(remained ~/ 60.0);
    final secs = converTwo(remained % 60);

    return Container(
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 15.0),
      color: color.AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-2.0, 2.0),
                      blurRadius: 8.0,
                      color: Color.fromARGB(48, 59, 59, 59),
                    )
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    if (noMute) {
                      _videoPlayerController?.setVolume(0.0);
                    } else {
                      _videoPlayerController?.setVolume(1.0);
                    }
                    setState(() {});
                  },
                  icon: Icon(noMute ? Icons.volume_up : Icons.volume_off),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              final index = _isPlayingIndex - 1;
              if (index >= 0 && _videoInfo.isNotEmpty) {
                _onTapVideo(index);
              } else {
                Get.snackbar(
                  "Video",
                  "",
                  snackPosition: SnackPosition.BOTTOM,
                  icon: const Icon(
                    Icons.face,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  backgroundColor: color.AppColor.gradientSecond,
                  colorText: Colors.white,
                  messageText: const Text(
                    "No videos ahead",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            },
            icon: const Icon(
              Icons.fast_rewind,
              size: 36.0,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              if (_isPlaying) {
                _videoPlayerController!.pause();

                setState(() {
                  _isPlaying = false;
                });
              } else {
                _videoPlayerController!.play();

                setState(() {
                  _isPlaying = true;
                });
              }
            },
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              size: 36.0,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              final index = _isPlayingIndex + 1;
              if (index <= _videoInfo.length - 1 && _videoInfo.isNotEmpty) {
                _onTapVideo(index);
              } else {
                Get.snackbar(
                  "Video",
                  "",
                  snackPosition: SnackPosition.BOTTOM,
                  icon: const Icon(
                    Icons.face,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  backgroundColor: color.AppColor.gradientSecond,
                  colorText: Colors.white,
                  messageText: const Text(
                    "You have finished watching all the vidoes. Congrats!",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            },
            icon: const Icon(
              Icons.fast_forward,
              size: 36.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 20.0),
            child: Text(
              "$mins:$secs",
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.0, 1.0),
                    blurRadius: 4.0,
                    color: Color.fromARGB(150, 0, 0, 0),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
