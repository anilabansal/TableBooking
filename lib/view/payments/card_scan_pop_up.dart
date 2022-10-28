
import 'package:booking_table/utils/common/images_string.dart';
import 'package:booking_table/view/payments/scan_cards_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScanPopUpView extends StatelessWidget {
  CardScanPopUpView({Key? key}) : super(key: key);
 // CardScanController controller = Get.put(CardScanController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 280,
          width: Get.width,
          margin: const EdgeInsets.symmetric(
            horizontal: 36,
          ),
          child: InkWell(
            onTap: ()async{
              Get.to(() => const ScanCardScreen());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Image.asset(
                  scanCard,
                  height: 168,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
