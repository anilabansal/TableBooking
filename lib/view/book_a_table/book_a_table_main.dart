import 'package:booking_table/view/book_a_table/book_a_table_body.dart';
import 'package:booking_table/view/book_a_table/widget/book_a_table_appbar.dart';
import 'package:flutter/material.dart';

class BookATableView extends StatelessWidget {
  const BookATableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: bookATableAppBar(),
      body: SingleChildScrollView(
        child: BookATableBody(),
      ),
    );
  }
}
