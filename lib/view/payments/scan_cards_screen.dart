import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';

class ScanCardScreen extends StatefulWidget {
  const ScanCardScreen({Key? key}) : super(key: key);

  @override
  State<ScanCardScreen> createState() => _ScanCardScreenState();
}

class _ScanCardScreenState extends State<ScanCardScreen> {
  CardDetails? _cardDetails;
  CardScanOptions scanOptions = const CardScanOptions(
    scanCardHolderName: true,
    // enableDebugLogs: true,
    validCardsToScanBeforeFinishingScan: 5,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.aboveCardNumber,
    ],
  );
 scanCard() async {
    final CardDetails? cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
    if ( !mounted || cardDetails == null ) return;
    // setState(() {
    //   _cardDetails = cardDetails;
    // });
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Stack(
            //   children: [
            //     const AppBarBackButton(),
            //     Center(
            //       child: CommonText(
            //         text: "Scan Card",
            //         fontWeight: FontWeight.w600,
            //         fontSize: 22,
            //         color: black000000,
            //       ),
            //     )
            //
            //   ],
            // ),
            Center(
              // child: MaterialButton(
              //   color: Colors.blue,
              //   onPressed: () async {
              //     scanCard();
              //   },
              //   child: const Text('scan card'),
              // ),
                child: scanCard()
            ),
          ],
        ),
      ),
    );
  }
}
