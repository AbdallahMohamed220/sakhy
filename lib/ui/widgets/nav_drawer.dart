import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/reports/reports.dart';
import 'package:sakhy/ui/views/splash/splash_screen.dart';
import 'package:sakhy/ui/widgets/profile_item.dart';

class navDrawer extends StatelessWidget {
  showLogoutDialog(context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF1C1C1C),
          title: Text(
            "Are you sure to logout?",
            style: TextStyle(color: AppColors.Alpine, fontSize: 17.h),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  GetStorage().remove("userId");
                  GetStorage().remove("email");
                  GetStorage().remove("userName");
                  GetStorage().remove("clientId");
                  Get.offAll(SplashScreen());
                },
                child: Text(
                  "Yes",
                  style: TextStyle(color: AppColors.Alpine, fontSize: 17.h),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "No",
                  style: TextStyle(color: AppColors.Alpine, fontSize: 17.h),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Styles.headingText("Profile"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                ),
                title: Text(
                  GetStorage().read("email"),
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
                ),
                subtitle: Text(
                  GetStorage().read("email"),
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp),
                ),
                dense: true,
              ),
              Styles.transparentDivider(),
              profileItem(
                "Personal Information",
                Icons.person_outline,
                () {},
              ),
              profileItem(
                "Reports",
                Icons.report,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReportsScreen()),
                  );
                },
              ),
              profileItem(
                "Payment Preferences",
                Icons.payment_outlined,
                () {},
              ),
              profileItem(
                "Automatic Payment",
                Icons.payments_outlined,
                () {},
              ),
              profileItem(
                "Loyalty Program",
                Icons.loyalty_outlined,
                () {},
              ),
              profileItem(
                "Language",
                Icons.language_outlined,
                () {},
              ),
              profileItem(
                "Notification",
                Icons.notifications_outlined,
                () {},
              ),
              profileItem(
                "Terms & Conditions",
                Icons.code_outlined,
                () {},
              ),
              profileItem(
                "FAQs",
                Icons.contact_support_outlined,
                () {},
              ),
              profileItem(
                "Support",
                Icons.support_outlined,
                () {},
              ),
              OutlinedButton(
                onPressed: () => showLogoutDialog(context),
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.Alpine,
                      fontSize: 20.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
