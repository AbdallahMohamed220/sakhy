import 'package:flutter/material.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class Transfer extends StatefulWidget {
  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  TextEditingController _amountController = TextEditingController();
  String _cardType = "Card Type";
  String _cardList = "Card List";
  String _cardTypeTransferTo = "Card Type";
  String _cardListTransferTo = "Card List";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer"),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColors.Alpine,
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.asset("assets/icons/transfer.png",scale: 5,),
              SizedBox(height: 10.h,),
              Text("Transfer money easily between cards",style: TextStyle(fontWeight: FontWeight.w600),),
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
                          fontWeight: FontWeight.w600,fontSize: 15.sp),
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
                            fontWeight: FontWeight.w600,fontSize: 15.sp),
                      ),
                    );
                  }).toList(),
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
                      _cardList,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,fontSize: 15.sp),
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
                      _cardList = newValue!;
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
                            fontWeight: FontWeight.w600,fontSize: 15.sp),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 40.h,),
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
                      _cardTypeTransferTo,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,fontSize: 15.sp),
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
                      _cardTypeTransferTo = newValue!;
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
                            fontWeight: FontWeight.w600,fontSize: 15.sp),
                      ),
                    );
                  }).toList(),
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
                      _cardListTransferTo,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,fontSize: 15.sp),
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
                      _cardListTransferTo = newValue!;
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
                            fontWeight: FontWeight.w600,fontSize: 15.sp),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Styles.transparentDivider(),
              formField(TextInputType.number, false, _amountController, true, Icons.monetization_on_outlined, context, "Enter The Amount"),
              Styles.transparentDivider(),
              fullWidthButton("Transfer", ()=>Navigator.pushNamed(context, route.confirmWithFaceID),),
            ],
          ),
        ),
      ),
    );
  }
}
