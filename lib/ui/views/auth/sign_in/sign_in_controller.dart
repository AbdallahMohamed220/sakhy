import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/views/auth/sign_in/sign_in_services.dart';
import 'package:sakhy/ui/views/home/bottom_nav_controller.dart';

class SignInController extends GetxController {
  var loadingProcess = false.obs;
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController loginBankemail = TextEditingController();

  final TextEditingController loginankpassword = TextEditingController();
  final signInformKey = GlobalKey<FormState>();
  final signInBankformKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> signIn() async {
    if (!signInformKey.currentState!.validate()) {
      return;
    }
    try {
      loadingProcess(true);
      var signInData = await SignInServices.signIn(email.text, password.text);
      if (signInData == 'found') {
        Get.offAll(BottomNavController());
      } else {
        Fluttertoast.showToast(
          msg: 'An error occuur Please check your data and try again',
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

  Future<void> loginInBank(String banckId) async {
    if (!signInBankformKey.currentState!.validate()) {
      return;
    }
    try {
      loadingProcess(true);
      var signInData = await SignInServices.loginInBank(
        banckId,
        loginBankemail.text,
        loginankpassword.text,
      );
      if (signInData == 'found') {
        Fluttertoast.showToast(
          msg: 'Your connect to the bank has been added successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.Alpine,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Future.delayed(Duration(seconds: 3), () {
          Get.offAll(BottomNavController());
        });
      } else {
        Fluttertoast.showToast(
          msg: 'An error occuur Please check your data and try again',
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
