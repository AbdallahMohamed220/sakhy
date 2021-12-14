import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/views/auth/sign_up/sign_up_controller.dart';
import 'package:sakhy/ui/widgets/auth_text_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';
import 'package:sakhy/ui/widgets/gradient_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/widgets/small_button.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // TextEditingController _firstNameController = TextEditingController();
  // TextEditingController _lastNameController = TextEditingController();

  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  bool _check = true;
  SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _signUpController.signUpformKey,
        child: gradientBackground(
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/sakhy.png",
                      width: 140.w,
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),
                    Text(
                      "Sign up",
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
                    SizedBox(
                      height: 12.h,
                    ),
                    // authTextField(
                    //   TextInputType.number,
                    //   false,
                    //   _firstNameController,
                    //   true,
                    //   null,
                    //   context,
                    //   "First Name",
                    // ),
                    // SizedBox(
                    //   height: 5.h,
                    // ),
                    // authTextField(
                    //   TextInputType.number,
                    //   false,
                    //   _lastNameController,
                    //   true,
                    //   null,
                    //   context,
                    //   "Last Name",
                    // ),
                    // SizedBox(
                    //   height: 5.h,
                    // ),
                    // authTextField(
                    //   TextInputType.number,
                    //   false,
                    //   _phoneController,
                    //   true,
                    //   Icons.phone_android_outlined,
                    //   context,
                    //   "Phone Number (05********)",
                    // ),
                    // SizedBox(
                    //   height: 5.h,
                    // ),
                    authTextField(
                      TextInputType.emailAddress,
                      false,
                      _signUpController.email,
                      true,
                      Icons.email_outlined,
                      context,
                      "E-mail",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    authTextField(
                      TextInputType.text,
                      true,
                      _signUpController.password,
                      true,
                      Icons.password_outlined,
                      context,
                      "Password",
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
                    Obx(
                      () => _signUpController.loadingProcess.value
                          ? Center(child: CircularProgressIndicator())
                          : fullWidthButton(
                              "Sign Up",
                              () => _signUpController.signUp(),
                            ),
                    ),

                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Already Have An Account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 13.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    smallButton(
                      "Login",
                      () => Navigator.pushNamed(context, route.signIn),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
