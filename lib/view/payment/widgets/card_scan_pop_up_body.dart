import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CardScanPopUpBody extends StatefulWidget {
   CardScanPopUpBody({
    Key? key,
  }) : super(key: key);
  @override
  State<CardScanPopUpBody> createState() => _CardScanPopUpBodyState();
}
class _CardScanPopUpBodyState extends State<CardScanPopUpBody> {
  // var cardDetails =  CardScanner.scanCard(
  //   scanOptions: CardScanOptions(
  //     scanCardHolderName: true
  //   )
  // );

  CardDetails? _cardDetails;
  CardScanOptions scanOptions = const CardScanOptions(
    scanCardHolderName: false,
    enableDebugLogs: true,
    // validCardsToScanBeforeFinishingScan: 5,
    // possibleCardHolderNamePositions: [
    //   CardHolderNameScanPosition.aboveCardNumber,
    // ],
  );

  Future<void> scanCard() async {
    var cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
    if (!mounted) return;
    setState(() {
      _cardDetails = cardDetails!;
    });
    print("cardDetails---->$_cardDetails");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              scanCard();
              //CardScanner.scanCard();

             // Navigator.pop(context);
             //  cardScanController. scanCardDetails();
            //  Get.to(() => const ScanCardScreen());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "assets/images/payment/card_scan.png",
                    height: 168,
                  ),
                ),
                Text(_cardDetails==null? "":_cardDetails!.cardNumber.toString())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
