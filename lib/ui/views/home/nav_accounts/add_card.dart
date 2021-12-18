import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_accounts/input_formatters.dart';
import 'package:sakhy/ui/views/home/nav_accounts/nav_accountS_controller.dart';
import 'package:sakhy/ui/views/home/nav_accounts/payment_card.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  NavAccountController _navAccountController = Get.put(NavAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Cards"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
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
      body: Form(
        key: _navAccountController.addCardformKey,
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            top: 20.h,
          ),
          child: Column(
            children: [
              new TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  new LengthLimitingTextInputFormatter(19),
                  new CardNumberInputFormatter()
                ],
                controller: _navAccountController.cardNumberController,
                maxLength: 22,
                validator: (value) {
                  if (value!.isEmpty || value.length != 22) {
                    return 'please enter a valid value';
                  }
                },
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 12.0,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF2F2F2),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF2F2F2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.Alpine),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: AppColors.Alpine),
                  ),
                  hintText: 'What number is written on card?',
                  labelText: 'Number',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xffF2F2F2),
                  ),
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xffF2F2F2),
                  ),
                  errorStyle: TextStyle(fontSize: 16.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.h, top: 15.h),
                child: Row(
                  children: [
                    Expanded(
                      child: new TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(4),
                          new CardMonthInputFormatter()
                        ],
                        controller:
                            _navAccountController.expiritionDateController,
                        validator: CardUtils.validateDate,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 12.0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF2F2F2),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF2F2F2),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.Alpine),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: AppColors.Alpine),
                          ),
                          hintText: 'MM/YY',
                          labelText: 'Expiry Date',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xffF2F2F2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xffF2F2F2),
                          ),
                          errorStyle: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.h,
                    ),

                    Expanded(
                      child: new TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(4),
                        ],
                        controller: _navAccountController.cvvController,
                        validator: CardUtils.validateCVV,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 12.0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF2F2F2),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFF2F2F2),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.Alpine),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: AppColors.Alpine),
                          ),
                          hintText: 'CVV',
                          labelText: 'CVV',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xffF2F2F2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xffF2F2F2),
                          ),
                          errorStyle: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    ),

                    // Expanded(
                    //   child: formField(
                    //     TextInputType.text,
                    //     false,
                    //     _navAccountController.expiritionDateController,
                    //     true,
                    //     Icons.description,
                    //     context,
                    //     "Expiration Date",
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 5.h,
                    // ),
                    // Expanded(
                    //   child: formField(
                    //     TextInputType.text,
                    //     false,
                    //     _navAccountController.cvvController,
                    //     true,
                    //     Icons.description,
                    //     context,
                    //     "Cvv",
                    //   ),
                    // ),
                  ],
                ),
              ),
              Styles.transparentDivider(),
              Obx(
                () => _navAccountController.cardsloadingProcess.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.Alpine,
                        ),
                      )
                    : fullWidthButton(
                        "Add a card",
                        () => _navAccountController.addCreditCard(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
