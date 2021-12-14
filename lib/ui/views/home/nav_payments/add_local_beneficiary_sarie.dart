import 'package:flutter/material.dart';
import 'package:sakhy/ui/route/route.dart' as route;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/widgets/form_field.dart';
import 'package:sakhy/ui/widgets/full_width_button.dart';

class AddLocalBeneficiarySarie extends StatefulWidget {
  @override
  _AddLocalBeneficiarySarieState createState() =>
      _AddLocalBeneficiarySarieState();
}

class _AddLocalBeneficiarySarieState extends State<AddLocalBeneficiarySarie> {
  TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Sarie Beneficiary"),
        centerTitle: true,
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back,size: 20.w,),),

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
              Image.asset(
                "assets/icons/account.png",
                scale: 5,
              ),
              Styles.transparentDivider(),
              formField(
                  TextInputType.text,
                  false,
                  _idController,
                  true,
                  Icons.person_outline,
                  context,
                  "Enter the id/phone/email number"),
              Styles.transparentDivider(),
              fullWidthButton(
                "Add",
                () => Navigator.pushNamed(context, route.addContact),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
