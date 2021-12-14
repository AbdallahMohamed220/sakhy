import 'package:flutter/material.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class AddCardSuccessfully extends StatefulWidget {
  @override
  _AddCardSuccessfullyState createState() => _AddCardSuccessfullyState();
}

class _AddCardSuccessfullyState extends State<AddCardSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Cards"),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColors.Alpine,
            size: 20.w,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.compare_arrows,
              color: AppColors.Alpine,
              size: 20.w,
            ),
          ),
        ],
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
              "The card was added successfully!",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            fullWidthButton(
              "My Cards",
              () {},
            ),
          ],
        ),
      ),
    );
  }
}
