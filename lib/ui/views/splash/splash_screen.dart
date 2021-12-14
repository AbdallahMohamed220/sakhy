import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/widgets/gradient_background.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF1C1C1C),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xFF1C1C1C),
      ),
    );
    _timer = Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, route.signUp),
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: gradientBackground(Center(
        child: Image.asset(
          "assets/icons/sakhy.png",
          fit: BoxFit.fill,
          width: 184.w,
          height: 122.h,
        ),
      )),
    );
  }
}
