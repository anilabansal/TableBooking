import 'package:booking_table/utils/common/widgets_methods/progress_loader.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/book_a_table/book_a_table_controller.dart';
import '../../../controller/home/home_controller.dart';
import '../../../controller/restaurant_details/restaurant_details_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/common_text_form_field.dart';

class BookTableDatePicker extends StatelessWidget {
  final TextEditingController? controller;
  final dynamic restaurantId;
  final int? bookingId;

  BookTableDatePicker(
      {Key? key, this.controller, this.restaurantId, this.bookingId})
      : super(key: key);
  BookATableController bookingTable = Get.find();
  RestaurantDetailsController restaurantDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        // color: fillColor,
      ),
      child: InkWell(
        onTap: () async {
          // bookingTable.selectTime.value = [];
          DateTime? picked = await showDatePicker(
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: redE2211C, // <-- SEE HERE
                  ),
                ),
                child: child!,
              );
            },
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(
              const Duration(days: 60),
            ),
          );
          if (picked != null) {
            // controller!.text = DateFormat('yyyy-MM-dd').format(picked);
            controller!.text = DateFormat('MM-dd-yyyy').format(picked);
            loadAllBookTime(context);
          }
        },
        child: CommonTextFormField(
          enable: false,
          controller: controller,
          hintText: "mm-dd-yyyy",
          filled: true,
          suffixIcon: const Icon(
            Icons.calendar_month_outlined,
            color: redE2211C,
            size: 22,
          ),
        ),
      ),
    );
  }

  loadAllBookTime(context) {
    bookingTable.isTimeLoading.value = true;
    bookingTable.selectTimeList.value = [];
    bookingTable.setSelectedBookTime(null);
    ProgressDialog.showProgressDialog(context);
    bookingTable.getAvailableBookingTime(context, body: {
      "RestaurantId": restaurantId,
      // "RestaurantId": "3",
      "BookingDate": DateFormat('yyyy-MM-dd').format(
        DateFormat('MM-dd-yyyy').parse(controller!.text),
      ),
      "BookingId": bookingId,
      // "BookingDate": controller!.text,
    }).then(
      (value) {
        bookingTable.isTimeLoading.value = false;
        if (value) {
          Navigator.pop(context);
        }
      },
    );
  }
}
