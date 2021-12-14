import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/views/auth/sign_in/sign_in_controller.dart';
import 'package:sakhy/ui/widgets/auth_text_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';
import 'package:sakhy/ui/widgets/gradient_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/widgets/small_button.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _signInController.signInformKey,
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
                      "Welcome Back!",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 24.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Login with your email & password",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14.sp),
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    authTextField(
                      TextInputType.emailAddress,
                      false,
                      _signInController.email,
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
                      _signInController.password,
                      true,
                      Icons.password_outlined,
                      context,
                      "Password",
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Obx(
                      () => _signInController.loadingProcess.value
                          ? Center(
                              child: CircularProgressIndicator(
                              color: AppColors.Alpine,
                            ))
                          : fullWidthButton(
                              "Login",
                              () => _signInController.signIn(),
                            ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "Don’t  Have An Account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 13.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    smallButton(
                      "Signup",
                      () => Navigator.pushNamed(context, route.signUp),
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
