import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';
import 'package:sakhy/ui/widgets/small_button.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Contact"),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
              "A Beneficiaries was added!",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            smallButton("Done", (){},),
          ],
        ),
      ),
    );
  }
}
