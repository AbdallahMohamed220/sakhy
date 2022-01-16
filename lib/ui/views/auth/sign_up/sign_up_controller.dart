import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/views/auth/sign_in/sign_in_screen.dart';
import 'package:sakhy/ui/views/auth/sign_in/sign_in_services.dart';
import 'package:sakhy/ui/views/auth/sign_up/sign_up_services.dart';
import 'package:sakhy/ui/views/home/bottom_nav_controller.dart';

class SignUpController extends GetxController {
  var loadingProcess = false.obs;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();

  final signUpformKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> signUp() async {
    if (!signUpformKey.currentState!.validate()) {
      return;
    }
    try {
      loadingProcess(true);
      var signInData = await SignUpServices.signUp(
        email.text,
        password.text,
        firstName.text,
        lastName.text,
      );
      if (signInData == 'success') {
        Fluttertoast.showToast(
          msg: 'Your account created successfully sign in now',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.Alpine,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Get.to(SignIn());
      } else {
        Fluttertoast.showToast(
          msg: 'User Already exist',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print(e);
    } finally {
      loadingProcess(false);
    }
  }
}
