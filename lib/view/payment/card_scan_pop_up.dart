import 'package:booking_table/controller/payment/card_scan_controller.dart';
import 'package:booking_table/utils/common/images_string.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScanPopUpView extends StatefulWidget {
  const CardScanPopUpView({Key? key}) : super(key: key);
  @override
  State<CardScanPopUpView> createState() => _CardScanPopUpViewState();
}
class _CardScanPopUpViewState extends State<CardScanPopUpView> {
  //CardDetails? _cardDetails;
  CardScanOptions scanOptions = const CardScanOptions(
    scanCardHolderName: true,
    //  enableDebugLogs: true,
    // validCardsToScanBeforeFinishingScan: 5,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.belowCardNumber,
    ],
  );

  scanCardDetails() async {
    final CardDetails? cardDetails =
        await CardScanner.scanCard(scanOptions: scanOptions);
    if (!mounted || cardDetails == null) return;
    // setState(() {
    //   _cardDetails = cardDetails;
    // });
  }

  CardScanController controller = Get.put(CardScanController());

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
            onTap: () {
              scanCardDetails();
              // Get.to(()=>const ScanCardScreen());
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
