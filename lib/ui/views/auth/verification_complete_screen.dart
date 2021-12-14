import 'package:flutter/material.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/widgets/auth_text_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';
import 'package:sakhy/ui/widgets/gradient_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class VerificationCompleteScreen extends StatefulWidget {
  @override
  _VerificationCompleteScreenState createState() =>
      _VerificationCompleteScreenState();
}

class _VerificationCompleteScreenState
    extends State<VerificationCompleteScreen> {
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
                "assets/icons/success.png",
                width: 130.w,
              ),
              Divider(
                color: Colors.transparent,
              ),
              Text(
                "ID verification",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: AppColors.Alpine),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Colors.transparent,
              ),
              Text(
                "your account has been activated",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15.h,
              ),
              fullWidthButton(
                "Start",
                    ()=>Navigator.pushNamed(context, route.createPasscode),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
