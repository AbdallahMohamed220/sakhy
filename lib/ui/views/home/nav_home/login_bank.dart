import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/auth/sign_in/sign_in_controller.dart';
import 'package:sakhy/ui/widgets/auth_text_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class LoginBank extends StatefulWidget {
  final String bankId;

  const LoginBank({Key? key, required this.bankId}) : super(key: key);
  @override
  _LoginBankState createState() => _LoginBankState();
}

class _LoginBankState extends State<LoginBank> {
  SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Styles.headingText("Bank Account Login"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColors.Alpine,
            size: 20.w,
          ),
        ),
        actions: [],
      ),
      body: Form(
        key: _signInController.signInBankformKey,
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 8.h,
              ),
              // Text(
              //   "Login with your email & password",
              //   style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
              //   textAlign: TextAlign.center,
              // ),
              Divider(
                color: Colors.transparent,
              ),
              SizedBox(
                height: 10.h,
              ),
              authTextField(
                TextInputType.emailAddress,
                false,
                _signInController.loginBankemail,
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
                _signInController.loginankpassword,
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
                        () => _signInController.loginInBank(widget.bankId),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
