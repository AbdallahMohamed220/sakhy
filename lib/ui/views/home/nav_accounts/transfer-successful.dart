import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_accounts/nav_accountS_controller.dart';
import 'package:sakhy/ui/widgets/small_button.dart';

class TransferSuccessful extends StatefulWidget {
  @override
  _TransferSuccessfulState createState() => _TransferSuccessfulState();
}

class _TransferSuccessfulState extends State<TransferSuccessful> {
  @override
  void initState() {
    super.initState();
    getAccount();
  }

  NavAccountController _navAccountController = Get.put(NavAccountController());
  getAccount() async {
    Future.delayed(Duration(seconds: 2), () async {
      Get.back();
      Get.back();
      Get.back();
      Get.back();
      await _navAccountController.fetchAccounts();
      await _navAccountController.fetchCreditCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: 20.w,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/success.png",
              width: 130.w,
            ),
            Styles.transparentDivider(),
            Text(
              "Money was transferred successfully!",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            smallButton(
              "Done",
              () {},
            ),
          ],
        ),
      ),
    );
  }
}
