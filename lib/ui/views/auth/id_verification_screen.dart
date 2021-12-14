import 'package:flutter/material.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/widgets/auth_text_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';
import 'package:sakhy/ui/widgets/gradient_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class IDVerification extends StatefulWidget {
  @override
  _IDVerificationState createState() => _IDVerificationState();
}

class _IDVerificationState extends State<IDVerification> {


  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  bool _check = true;

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
              Text(
                "ID verification",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24.sp),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Colors.transparent,
              ),
              Image.asset(
                "assets/icons/contact.png",
                width: 130.w,
              ),
              Divider(
                color: Colors.transparent,
              ),
              Text(
                "Please enter your ID number for verification",
                style:
                TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Colors.transparent,
              ),
              authTextField(
                TextInputType.number,
                false,
                _idNumberController,
                true,
                Icons.person_outline_sharp,
                context,
                "ID Number",
              ),
              SizedBox(height: 5.h,),


              authTextField(
                TextInputType.text,
                false,
                _birthDateController,
                true,
                Icons.calendar_today_outlined,
                context,
                "Birth Date",
              ),
              Row(
                children: [
                  Checkbox(
                    value: _check,
                    onChanged: (val) {
                      setState(() {
                        _check = !_check;
                      });
                    },
                  ),
                  RichText(
                    text: TextSpan(
                        text: "I have read and agree",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12.sp),
                        children: [
                          TextSpan(
                            text: " Terms & Services",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.sp,
                                color: AppColors.Alpine),
                          ),
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              fullWidthButton("Next", ()=>Navigator.pushNamed(context, route.verificationComplete),),

            ],
          ),
        ),
      ),
    );
  }
}
