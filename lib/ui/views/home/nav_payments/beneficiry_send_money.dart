import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_payments/Beneficiary_controller.dart';
import 'package:sakhy/ui/widgets/bank_card.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class BeneficarySendMoney extends StatefulWidget {
  final String id;

  const BeneficarySendMoney({Key? key, required this.id}) : super(key: key);
  @override
  _BeneficarySendMoneyState createState() => _BeneficarySendMoneyState();
}

class _BeneficarySendMoneyState extends State<BeneficarySendMoney> {
  List<String> _bankNames = ["Riyad Bank ", "Al-Rajhi Bank", "Al-Ahly Bank"];
  List<String> _bankBalance = ["2000", "1000", "1500"];
  List<Color> _cardColors = [
    Colors.blue,
    Colors.lightGreen,
    Colors.deepPurpleAccent
  ];

  int _dotPosition = 0;
  String _reasonForTransfer = "Reason For Transfer";
  TextEditingController _amountController = TextEditingController();
  String _reasonForSending = "";
  BeneficiaryController _beneficiaryController =
      Get.put(BeneficiaryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Money"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 15.h,
        ),
        child: Form(
          key: _beneficiaryController.sendMoneyBenefciarFormKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sakhyCard(
                  "Sakhy Card",
                  "100000 SAR",
                  () {},
                  context,
                ),
                Styles.transparentDivider(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "To",
                //       style:
                //           TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                //     ),
                //     Icon(
                //       Icons.person_add_alt_1_outlined,
                //       color: AppColors.Alpine,
                //       size: 20.w,
                //     ),
                //   ],
                // ),
                Styles.transparentDivider(),
                // AspectRatio(
                //   aspectRatio: 3.7,
                //   child: Container(
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: 10,
                //       itemBuilder: (_, index) {
                //         return Container(
                //           width: 75.w,
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               CircleAvatar(
                //                 backgroundColor: Colors.white,
                //               ),
                //               SizedBox(
                //                 height: 5.h,
                //               ),
                //               Text(
                //                 "Afran\nSarkar",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(fontSize: 15.sp),
                //               ),
                //             ],
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
                Styles.transparentDivider(),
                Text(
                  "Amount",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                formField(
                    TextInputType.number,
                    false,
                    _beneficiaryController.sendMoneyAmount,
                    true,
                    Icons.monetization_on_outlined,
                    context,
                    "Enter The Amount"),
                Styles.transparentDivider(),
                // Text(
                //   "Reason of transfer",
                //   style:
                //   TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                // ),
                // SizedBox(height: 8.h,),
                Text(
                  "Reason of transfer",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                formField(
                    TextInputType.text,
                    false,
                    _beneficiaryController.sendMoneyReason,
                    true,
                    Icons.monetization_on_outlined,
                    context,
                    "Enter The Reason"),
                Styles.transparentDivider(),
                // Container(
                //   width: ScreenUtil().screenWidth,
                //   decoration: BoxDecoration(
                //     color: Colors.transparent,
                //     border: Border.all(color: Colors.white, width: 1),
                //   ),
                //   child: DropdownButton<String>(
                //     hint: Padding(
                //       padding: EdgeInsets.only(
                //           left: 15, bottom: 11, top: 11, right: 15),
                //       child: Text(
                //         _reasonForSending,
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.w500,fontSize: 15.sp),
                //       ),
                //     ),
                //     icon: IconButton(
                //       onPressed: null,
                //       icon: Icon(
                //         Icons.arrow_downward,
                //         color: AppColors.Alpine,
                //         size: 20.w,
                //       ),
                //     ),
                //     isExpanded: true,
                //     iconSize: 18,
                //     underline: Container(
                //       height: 0,
                //       color: Colors.transparent,
                //     ),
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         _reasonForSending = newValue!;
                //       });
                //     },
                //     items: <String>['One', 'Two', 'Three', 'Four']
                //         .map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(
                //           value,
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontWeight: FontWeight.w500,fontSize: 15.sp),
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
                Styles.transparentDivider(),
                Obx(
                  () => _beneficiaryController.loadingProcess.value
                      ? Center(
                          child: CircularProgressIndicator(
                          color: AppColors.Alpine,
                        ))
                      : fullWidthButton(
                          "Send",
                          () =>
                              //Navigator.pushNamed(context, route.confirmWithFaceID),
                              _beneficiaryController
                                  .beneficiarySendMoney(widget.id)),
                ),

                Styles.transparentDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
