import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:sakhy/ui/const/app_strings.dart';
import 'package:sakhy/ui/route/route.dart' as route;

void main() async {
  await GetStorage.init();
  final box = GetStorage();
  var token = box.read('userId');

  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({Key? key, this.token}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: ThemeData(
            textTheme: GoogleFonts.interTextTheme(
              Theme.of(context).textTheme.apply(
                    bodyColor: Colors.white,
                  ),
            ),
            appBarTheme: AppBarTheme(
              brightness: Brightness.dark,
              backgroundColor: Color(0xFF1C1C1C),
              textTheme: TextTheme(
                  headline6: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              )),
              elevation: 0,
              iconTheme: IconThemeData(
                color: AppColors.Alpine,
              ),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            scaffoldBackgroundColor: Color(0xFF1C1C1C),
          ),
          onGenerateRoute: route.controller,
          initialRoute:
              token == null ? route.splashScreen : route.bottomNavController,
        );
      },
    );
  }
}
