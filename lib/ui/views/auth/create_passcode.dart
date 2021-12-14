import 'package:flutter/material.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/widgets/dialpad.dart';

import 'package:sakhy/ui/widgets/full_width_button.dart';
import 'package:sakhy/ui/widgets/gradient_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class CreatePasscode extends StatefulWidget {
  @override
  _CreatePasscodeState createState() => _CreatePasscodeState();
}

class _CreatePasscodeState extends State<CreatePasscode> {
  var value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: gradientBackground(
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/sakhy.png",
                width: 130.w,
              ),
              Divider(
                color: Colors.transparent,
              ),
              Text(
                "Create a passcode",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                    color: AppColors.Alpine),
                textAlign: TextAlign.center,
              ),
              Styles.transparentDivider(),
              Text(
                "$value",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                    color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Wrap(
                spacing: 60.w,
                children: [
                  dialPadButton(() {
                    setState(() {
                      value = value + "1";
                    },);
                  }, "1"),
                  dialPadButton(() {
                    setState(() {
                      value = value + "2";
                    });
                  }, "2"),
                  dialPadButton(() {
                    setState(() {
                      value = value + "3";
                    });
                  }, "3"),
                  dialPadButton(() {
                    setState(() {
                      value = value + "4";
                    });
                  }, "4"),
                  dialPadButton(() {
                    setState(() {
                      value = value + "5";
                    });
                  }, "5"),
                  dialPadButton(() {
                    setState(() {
                      value = value + "6";
                    });
                  }, "6"),
                  dialPadButton(() {
                    setState(() {
                      value = value + "7";
                    });
                  }, "7"),
                  dialPadButton(() {
                    setState(() {
                      value = value + "8";
                    });
                  }, "8"),
                  dialPadButton(() {
                    setState(() {
                      value = value + "9";
                    });
                  }, "9"),
                  dialPadButton(() {}, ""),
                  dialPadButton(() {
                    setState(() {
                      value = value + "0";
                    });
                  }, "0"),
                  dialPadButton(() {
                    setState(() {
                      if (value.length > 0) {
                        value = value.substring(0, value.length - 1);
                      }
                    });
                  }, "x"),
                ],
              ),
              Styles.transparentDivider(),


              fullWidthButton(
                "Done",
                () {
                  if (value.length < 6)Navigator.pushNamed(context, route.bottomNavController);
                    // Styles.toastMessage("Password must be 6-8 digits");
                  else if (value.length > 8)Navigator.pushNamed(context, route.bottomNavController);
                    // Styles.toastMessage("Password must be 6-8 digits");
                  else
                    Navigator.pushNamed(context, route.bottomNavController);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
