import 'package:booking_table/view/terms_n_conditions/terms_n_conditions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: Material(
        child: TermsNConditionsView(),
      ),
    );
  }
}
