import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_payments/Beneficiary_controller.dart';
import 'package:sakhy/ui/widgets/bill-details-data.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class BillDetails extends StatefulWidget {
  @override
  _BillDetailsState createState() => _BillDetailsState();
}

BeneficiaryController _beneficiaryController = Get.put(BeneficiaryController());

class _BillDetailsState extends State<BillDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bill Details"),
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
          left: 25.w,
          right: 25.w,
          top: 20.h,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.asset(
                "assets/icons/bill-payments.png",
                scale: 5,
              ),
              Styles.transparentDivider(),
              billDetailsData("Bill Holder", "Saad Alwehaimed"),
              billDetailsData("Bill Number", "234433443"),
              billDetailsData("Bill Type", "Electricity bill"),
              billDetailsData("Bill Date", "12/2/2021"),
              billDetailsData("Amount", "1000 SAR"),
              Styles.transparentDivider(),
              Obx(
                () => _beneficiaryController.loadingProcess.value
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.Alpine,
                      ))
                    : fullWidthButton(
                        "Pay",
                        () =>
                            //Navigator.pushNamed(context, route.confirmWithFaceID),
                            _beneficiaryController.bill()),
              ),
              // fullWidthButton(
              //   "Pay",
              //   () => Navigator.pushNamed(context, route.confirmWithFaceID),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
