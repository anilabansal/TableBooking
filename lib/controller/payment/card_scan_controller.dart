import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScanController extends GetxController {
  var cardExpiryDate = TextEditingController();
  var bankName = TextEditingController();
  var cardHolderName = TextEditingController();
  var cardNumber = TextEditingController();
  var cardCVV = TextEditingController();
  CardDetails? cardInfoDetails;
  CardScanOptions scanOptions = const CardScanOptions(
    scanCardHolderName: true,
     enableDebugLogs: true,
  // validCardsToScanBeforeFinishingScan: 5,
  //   possibleCardHolderNamePositions: [
  //     CardHolderNameScanPosition.belowCardNumber,
  //   ],
  );

  scanCardDetails() async {
    final CardDetails? cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
    if ( cardDetails == null){
      return;
    }
   else{
      cardInfoDetails = cardDetails;
      cardHolderName.text = cardInfoDetails!.cardHolderName;
      cardNumber.text = cardInfoDetails!.cardNumber;
      cardExpiryDate.text = cardInfoDetails!.expiryDate;
      print("cardInfo--->$cardInfoDetails");
      print("cardNo--->$cardNumber.text");
    }


  }



}
