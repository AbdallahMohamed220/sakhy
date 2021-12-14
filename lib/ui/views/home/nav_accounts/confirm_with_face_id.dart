import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';

import 'package:sakhy/ui/route/route.dart' as route;
import 'package:sakhy/ui/widgets/small_button.dart';

class ConfirmWithFaceID extends StatefulWidget {
  @override
  _ConfirmWithFaceIDState createState() => _ConfirmWithFaceIDState();
}

class _ConfirmWithFaceIDState extends State<ConfirmWithFaceID> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back,size: 20.w,),),

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
            Image.asset("assets/icons/face-id.png",scale: 5,),
            SizedBox(height: 15.h,),
            Styles.headingText("Confirm with face ID"),
            Styles.transparentDivider(),
            smallButton("Confirm", ()=>Navigator.pushNamed(context, route.transferSuccessful),),
          ],
        ),
      ),
    );
  }
}
