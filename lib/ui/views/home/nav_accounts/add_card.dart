import 'package:flutter/material.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController _cardNameController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiritionDateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  String _cardType = "Card Type";

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
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 20.h,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //   formField(TextInputType.text, false, _cardNameController, true, Icons.person_outline, context, "Card Name"),
              // formField(TextInputType.number, true, _cardNumberController, true, Icons.payment, context, "Card Number"),
              Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: TextField(
                          keyboardType: TextInputType.datetime,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                          controller: _expiritionDateController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 12.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF2F2F2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.Alpine),
                            ),
                            hintText: "Expiration Date",
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xFF828282),
                            ),
                            errorStyle: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.h,
                    ),
                    Expanded(
                      child: Container(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                          controller: _cvvController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 12.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF2F2F2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.Alpine),
                            ),
                            hintText: "CVV",
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xFF828282),
                            ),
                            errorStyle: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                    });
                  },
                  items: <String>['One', 'Two', 'Three', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
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
              fullWidthButton(
                "Add a card",
                () => Navigator.pushNamed(context, route.addedCardSuccessfully),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
