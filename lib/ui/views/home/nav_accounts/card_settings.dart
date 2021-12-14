import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/widgets/accounts_small_item.dart';

class CardSettings extends StatefulWidget {
  @override
  _CardSettingsState createState() => _CardSettingsState();
}

class _CardSettingsState extends State<CardSettings> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF333333),
        title: Text("Card Settings"),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Container(
                height: 160.h,
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/card-background.PNG",),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF5B4A1C),
                      Color(0xFF302206),
                    ],
                    radius: 1,

                  ),
                ),
                child: ElevatedButton(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h,bottom: 10.h,left: 10.w,right: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sakhy Card",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: AppColors.Alpine,
                                letterSpacing: 1.8.sp,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                "assets/icons/sakhy.png",
                                width: 42.w,
                                height: 28.h,
                                fit: BoxFit.fill,
                                color: AppColors.Alpine,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "4343  4334  3767  3323",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Color(0xFFF8BC29),
                                    letterSpacing: 15.sp,
                                    fontSize: 80.sp,
                                    shadows: <Shadow>[
                                      Shadow(
                                        offset: Offset(7.0, 7.0),
                                        blurRadius: 1.0,
                                        color: Color.fromARGB(255, 35, 34, 34),
                                      ),
                                      Shadow(
                                        offset: Offset(7.0, 7.0),
                                        blurRadius: 2.0,
                                        color: Color.fromARGB(125, 35, 34, 34),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "EXPIRES  ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.sp,
                                        color: AppColors.Alpine),
                                  ),
                                  Text(
                                    "05 / 25",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Color(0xFFF8BC29),

                                        fontSize: 15.sp,
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 1.0,
                                            color: Color.fromARGB(255, 35, 34, 34),
                                          ),
                                          Shadow(
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 2.0,
                                            color: Color.fromARGB(125, 35, 34, 34),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: Icon(
                                    Icons.web,
                                    color: AppColors.Alpine,
                                    size: 20.w,
                                  ),
                                ),
                                Text(
                                  "Balance ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: AppColors.Alpine,),
                                ),
                                Text(
                                  "100000 SAR",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: AppColors.Alpine,),
                                ),
                              ],
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.r),
                      ),
                    ),),
                ),
              ),
            ),
            Styles.transparentDivider(),
            Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                accountSmallItem((){}, Icons.lock_outline, "Lock"),
                accountSmallItem((){}, Icons.vpn_key_outlined, "Pin"),
                accountSmallItem((){}, Icons.remove_red_eye_outlined, "Show"),
                accountSmallItem((){}, Icons.payment, "Add To"),
              ],
            ),
            Styles.transparentDivider(),

          ],
        ),
      ),
    );
  }
}
