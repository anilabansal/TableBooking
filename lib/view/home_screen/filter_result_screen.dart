import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/view/home_screen/widgets/filter_result_body.dart';
import 'package:flutter/material.dart';

import '../../utils/common/widgets_methods/common_app_bar.dart';

class FilterResultScreen extends StatelessWidget {
  const FilterResultScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appBarCommon(text: "Filter Result"),
      body: const FilterResultBody(),
    );
  }
}
