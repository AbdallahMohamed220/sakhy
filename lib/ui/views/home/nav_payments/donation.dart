import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_payments/Beneficiary_controller.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  String _cardType = "Organization";
  TextEditingController _amountController = TextEditingController();
  BeneficiaryController _beneficiaryController =
      Get.put(BeneficiaryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donation"),
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
          top: 20.h,
        ),
        child: Form(
          key: _beneficiaryController.donationformKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Image.asset(
                  "assets/icons/donation.png",
                  scale: 5,
                ),
                Styles.transparentDivider(),
                Container(
                  width: ScreenUtil().screenWidth,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: DropdownButton<String>(
                    hint: Padding(
                      padding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      child: Text(
                        _cardType,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp),
                      ),
                    ),
                    icon: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppColors.Alpine,
                        size: 20.w,
                      ),
                    ),
                    isExpanded: true,
                    iconSize: 18,
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _cardType = newValue!;
                        _beneficiaryController.donationOrganization = _cardType;
                      });
                    },
                    items: <String>[
                      'Masr el kair',
                      'Resala',
                      'El orman',
                      'Bank Taam el masry'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Styles.transparentDivider(),
                formField(
                    TextInputType.number,
                    false,
                    _beneficiaryController.donationAmount,
                    true,
                    Icons.monetization_on_outlined,
                    context,
                    "Enter The Amount"),
                Styles.transparentDivider(),
                Obx(
                  () => _beneficiaryController.loadingProcess.value
                      ? Center(
                          child: CircularProgressIndicator(
                          color: AppColors.Alpine,
                        ))
                      : fullWidthButton(
                          "Donate",
                          () =>
                              //Navigator.pushNamed(context, route.confirmWithFaceID),
                              _beneficiaryController.donation()),
                ),
                // fullWidthButton(
                //   "Donate",
                //   () => Navigator.pushNamed(context, route.confirmWithFaceID),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
