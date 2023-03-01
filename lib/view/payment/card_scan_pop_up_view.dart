// import 'package:booking_table/controller/payment/card_scan_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../utils/common/common_strings.dart';
//
// class CardScanPopUpView extends StatelessWidget {
//   CardScanPopUpView({Key? key}) : super(key: key);
//
//   CardScanController controller = Get.put(CardScanController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       // body: CardScanPopUpBody(controller: controller),
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           height: 280,
//           width: Get.width,
//           margin: const EdgeInsets.symmetric(
//             horizontal: 36,
//           ),
//           child: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//               controller.scanCardDetails();
//               //  Get.to(() => const ScanCardScreen());
//             },
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Center(
//                   child: Image.asset(
//                     scanCard,
//                     height: 168,
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
