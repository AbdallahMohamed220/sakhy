import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';
import 'package:sakhy/ui/widgets/gradient_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/widgets/small_button.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List title = [
    'Cool heading onboarding',
    'Cool heading onboarding',
    'Cool heading onboarding'
  ];
  List description = [
    'Even more cool subheading which will not be read by the user',
    'Even more cool subheading which will not be read by the user',
    'Even more cool subheading which will not be read by the user'
  ];
  List image = [
    'assets/images/onboarding-one.png',
    'assets/images/onboarding-two.png',
    'assets/images/onboarding-three.png'
  ];

  static int initialpage = 0;
  int _currentindex = 0;

  PageController _controller = PageController(
    initialPage: initialpage,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentindex != 0
          ? AppBar(
              backgroundColor: Color(0xFF1C1C1C),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  _controller.previousPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceOut);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.Alpine,
                ),
              ),
            )
          : AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color(0xFF1C1C1C),
              elevation: 0,
            ),
      body: gradientBackground(Column(
        children: [
          Expanded(
            child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemCount: title.length,
                onPageChanged: (currentIndex) {
                  setState(() {
                    _currentindex = currentIndex;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            image[index],
                            height: 200.h,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            title[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 19.sp,),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            description[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15.sp),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          DotsIndicator(
                            dotsCount: title.length,
                            position: _currentindex.toDouble(),
                            decorator: DotsDecorator(
                                color: Colors.white, // Inactive color
                                activeColor: AppColors.Alpine,
                                activeSize: Size(12, 12),
                                spacing: EdgeInsets.all(3)),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          _currentindex == title.length - 1
                              ? fullWidthButton(
                                  "Let's Go",
                                  () => Navigator.pushNamed(
                                      context, route.signUp),
                                )
                              : smallButton(
                                  "Next",
                                  () {
                                    _controller.nextPage(
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.bounceOut);
                                  },
                                ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}
