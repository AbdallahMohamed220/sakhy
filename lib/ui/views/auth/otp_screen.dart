import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';
import 'package:sakhy/ui/widgets/gradient_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  TextEditingController _pinController = TextEditingController();
  int _counter = 60;
  Timer? _timer;

  void _startTimer() {
    _counter = 60;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }
  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: gradientBackground(
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enter verification code",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Colors.transparent,
              ),
              Image.asset(
                "assets/icons/message.png",
                width: 130.w,
              ),
              Divider(
                color: Colors.transparent,
              ),
              Text(
                "Enter the verification code that was\nsent to your phone number",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Color(0xFFF2F2F2),
                ),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Colors.transparent,
              ),
              PinCodeTextField(
                controller: _pinController,
                appContext: context,
                length: 6,
                onChanged: (val) {},
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  inactiveColor: AppColors.Alpine,
                  activeColor: Colors.blue,
                  fieldHeight: 48.h,
                  fieldWidth: 48.h,
                  activeFillColor: Colors.white,
                ),
              ),
              Divider(
                color: Colors.transparent,
              ),
              fullWidthButton(
                "Confirm",
                () => Navigator.pushNamed(context, route.idVerification),
              ),
              Divider(
                color: Colors.transparent,
              ),
              Center(
                child: Text(
                    _counter.toString(),
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
