import 'dart:ui';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
/// alert dialog on payment screen
commonAlertDialog(context,double?amount,okOnTap) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: AlertDialog(
          backgroundColor: white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          content: Container(
            width: 300,
            height: 180,
            color: white,
            child: Column(
              children: [
                CommonText(
                  text: "Amount To Be Pay",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: black040404,
                ),
                const SizedBox(height: 20,),
                Center(
                  child: CommonText(
                    text: "\$${amount!.toStringAsFixed(2)}",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: black040404,
                  ),
                ),
                const SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: redE2211C
                            ),
                            child:Center(
                              child: CommonText(
                                text: "Cancel",
                                color: white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ) ,
                          ),),
                    ) ,
                    const SizedBox(width: 10,),
                    Expanded(
                      child: InkWell(
                        onTap: okOnTap,
                        child: Container(
                         width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green
                          ),
                          child:Center(
                            child: CommonText(
                              text: "Ok",
                              color: white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ) ,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

/// alert dialog for restaurant closed on selected date

commonRestaurantAlertDialog(context,message) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: AlertDialog(
          backgroundColor: white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          content: Container(
            width: 300,
            height: 100,
            color: white,
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.close,
                      color: black0D0000,
                      size: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                CommonText(
                  softWrap: true,
                  text: message,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: black040404,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}