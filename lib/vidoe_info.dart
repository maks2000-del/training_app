import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/colors.dart' as color;

class VidoeInfo extends StatefulWidget {
  const VidoeInfo({Key? key}) : super(key: key);

  @override
  State<VidoeInfo> createState() => _VidoeInfoState();
}

class _VidoeInfoState extends State<VidoeInfo> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      info = json.decode(value);
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst.withOpacity(0.8),
              color.AppColor.gradientSecond,
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60, right: 30.0, left: 30.0),
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
                              color
                                  .AppColor.secondPageContainerGradient1stColor,
                              color
                                  .AppColor.secondPageContainerGradient2ndColor,
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
                                color: color.AppColor.secondPageTitleColor,
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
                              color
                                  .AppColor.secondPageContainerGradient1stColor,
                              color
                                  .AppColor.secondPageContainerGradient2ndColor,
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
                                color: color.AppColor.secondPageTitleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                        )
                      ],
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
}
