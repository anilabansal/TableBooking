import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/view/book_a_table/widget/upcoming_reservation_body.dart';
import 'package:flutter/material.dart';

class UpcomingBookingDetailsView extends StatelessWidget {
  const UpcomingBookingDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(
        text: 'Booking Details',
      ),
      body: const UpcomingReservationBody(),
    );
  }
}
