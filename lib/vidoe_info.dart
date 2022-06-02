import 'dart:convert';

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

  _onTapVideo(int index) {
    final videoController =
        VideoPlayerController.network(_videoInfo[index]['videoUrl']);
    _videoPlayerController = videoController;
    setState(() {});
    videoController.initialize().then((_) {
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
}
