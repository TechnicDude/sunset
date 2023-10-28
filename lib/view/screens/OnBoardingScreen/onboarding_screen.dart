import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sunsetgardenapp/page_routes/routes.dart';
import 'package:sunsetgardenapp/utils/appcolors.dart';
import 'package:sunsetgardenapp/utils/appstyles.dart';
import 'package:sunsetgardenapp/view/screens/OnBoardingScreen/onboarding_contents.dart';
import 'package:sunsetgardenapp/view/screens/OnBoardingScreen/size_config.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List<List<Color>> colors = [
    [
      AppColors.welcomecolorfirst.withOpacity(0.3),
      AppColors.colorswhite,
      AppColors.colorswhite,
      AppColors.welcomecolorfirst.withOpacity(0.3),
    ],
    [
      AppColors.welcomecolorsec.withOpacity(0.3),
      AppColors.colorswhite,
      AppColors.colorswhite,
      AppColors.welcomecolorsec.withOpacity(0.3),
    ],
    [
      AppColors.welcomecolor.withOpacity(0.3),
      AppColors.colorswhite,
      AppColors.colorswhite,
      AppColors.welcomecolorfirst.withOpacity(0.3),
    ],
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: AppColors.primarycolors,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 30 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 0.2, 0.7, 1.6],
            colors: colors[_currentPage],
          )),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  itemCount: contents.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            contents[i].image,
                            height: SizeConfig.blockV! * 43,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          SizedBox(
                            width: 70.w,
                            child: Center(
                              child: Text(
                                contents[i].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontFamily: "Poppins",
                                  fontSize: (width <= 550) ? 18 : 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _currentPage + 1 == contents.length
                        ? Padding(
                            padding: EdgeInsets.all(1.h),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.welcomeScreen);
                              },
                              child: Text(
                                "START",
                                style: AppStyles.onboardtitle.copyWith(
                                    fontSize: 16.sp,
                                    color: AppColors.colorswhite),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primarycolors,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: (width <= 550)
                                    ? const EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 20)
                                    : EdgeInsets.symmetric(
                                        horizontal: width * 0.2, vertical: 25),
                                textStyle: TextStyle(
                                    fontSize: (width <= 550) ? 13 : 17),
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.welcomeScreen);
                                  },
                                  child: Text(
                                    "SKIP",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  style: TextButton.styleFrom(
                                    elevation: 0,
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: (width <= 550) ? 14 : 17,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    contents.length,
                                    (int index) => _buildDots(
                                      index: index,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  child: Text(
                                    "NEXT",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  style: TextButton.styleFrom(
                                    elevation: 0,
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: (width <= 550) ? 14 : 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
