import 'package:flutter/material.dart';
import 'package:sakhy/ui/widgets/bank_card.dart';
import 'package:sakhy/ui/route/route.dart' as route;

class SakhyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            sakhyCard("Total","100000 SAR",()=>Navigator.pushNamed(context, route.cardDetails),context),

          ],
        ),
      ),
    );
  }
}
