import 'package:booking_table/view/summary/mid_service_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: Material(
        child: ServiceSummaryView(
          callFrom: '',
        ),
      ),
    );
  }
}
