import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/view/book_a_table/book_a_table_body.dart';
import 'package:flutter/material.dart';

class BookATableView extends StatelessWidget {
  const BookATableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(text: 'Book a Table'),
      body: SingleChildScrollView(
        child: BookATableBody(),
      ),
    );
  }
}
