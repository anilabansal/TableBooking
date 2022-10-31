import 'package:booking_table/controller/payment/card_scan_controller.dart';
import 'package:booking_table/view/payment/widgets/card_scan_pop_up_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScanPopUpView extends StatelessWidget {
  CardScanPopUpView({Key? key}) : super(key: key);
  // @override
  // State<CardScanPopUpView> createState() => _CardScanPopUpViewState();
// }
//
// class _CardScanPopUpViewState extends State<CardScanPopUpView> {
  //CardDetails? _cardDetails;
  // CardScanOptions scanOptions = const CardScanOptions(
  //   scanCardHolderName: true,
  //   //  enableDebugLogs: true,
  //   // validCardsToScanBeforeFinishingScan: 5,
  //   possibleCardHolderNamePositions: [
  //     CardHolderNameScanPosition.belowCardNumber,
  //   ],
  // );

  // scanCardDetails() async {
  //   final CardDetails? cardDetails =
  //       await CardScanner.scanCard(scanOptions: scanOptions);
  //   if (!mounted || cardDetails == null) return;
  // setState(() {
  //   _cardDetails = cardDetails;
  // });
  // }

  CardScanController controller = Get.put(CardScanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CardScanPopUpBody(controller: controller),
    );
  }
}
