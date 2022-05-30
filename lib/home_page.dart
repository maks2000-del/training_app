import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/colors.dart' as color;

import 'vidoe_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
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
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20.0,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20.0,
                  color: color.AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20.0,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageDetail,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const VidoeInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  color.AppColor.gradientFirst.withOpacity(0.8),
                  color.AppColor.gradientSecond.withOpacity(0.9),
                ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(80.0),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5.0, 10.0),
                    blurRadius: 20.0,
                    color: color.AppColor.gradientSecond.withOpacity(0.3),
                  )
                ],
              ),
              child: Container(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 25.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next workout",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "and Gluts Workout",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20.0,
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "60 min",
                              style: TextStyle(
                                fontSize: 14.0,
                                color:
                                    color.AppColor.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            boxShadow: [
                              BoxShadow(
                                color: color.AppColor.gradientFirst,
                                blurRadius: 10.0,
                                offset: const Offset(4.0, 6.0),
                              )
                            ],
                          ),
                          child: const Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 60.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 180.0,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120.0,
                    margin: const EdgeInsets.only(top: 30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/card.jpg"),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40.0,
                          offset: const Offset(-1.0, -5.0),
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 200.0, bottom: 30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/figure.png"),
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left: 150.0, top: 50.0),
                    child: Column(
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.homePageDetail,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        RichText(
                          text: TextSpan(
                            text: "Keep it up\n",
                            style: TextStyle(
                              color: color.AppColor.homePagePlanColor,
                              fontSize: 16.0,
                            ),
                            children: const [
                              TextSpan(text: "stick to your plan"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Area of focus",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: info.length.toDouble() ~/ 2,
                    itemBuilder: (_, i) {
                      int a = i * 2;
                      int b = i * 2 + 1;
                      return Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            height: 160.0,
                            width: (MediaQuery.of(context).size.width - 60) / 2,
                            margin: const EdgeInsets.only(
                              left: 20.0,
                              bottom: 10.0,
                              top: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                image: AssetImage(info[a]['img']),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  offset: const Offset(5.0, 5.0),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.1),
                                ),
                                BoxShadow(
                                  blurRadius: 3.0,
                                  offset: const Offset(-5.0, -5.0),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[a]['title'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: color.AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            height: 160.0,
                            width: (MediaQuery.of(context).size.width - 60) / 2,
                            margin: const EdgeInsets.only(
                              left: 20.0,
                              bottom: 10.0,
                              top: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                image: AssetImage(info[b]['img']),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  offset: const Offset(5.0, 5.0),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.1),
                                ),
                                BoxShadow(
                                  blurRadius: 3.0,
                                  offset: const Offset(-5.0, -5.0),
                                  color: color.AppColor.gradientSecond
                                      .withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[b]['title'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: color.AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
