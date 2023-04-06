import 'package:booking_table/model/book_table_modals/party_size_list_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/book_a_table/book_a_table_controller.dart';
import '../../../utils/common/common_strings.dart';

class BookTablePartySizeDropDown extends StatelessWidget {
  const BookTablePartySizeDropDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookATableController>(builder: (bookTableController) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: greyF5F5F5,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 12,
        ),
        width: Get.width,
        child: DropdownButton<PartySize>(
            isExpanded: true,
            underline: const SizedBox(),
            borderRadius: BorderRadius.zero,
            hint: const Text(
              'Number of Guests',
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: black000000,
              size: 25,
            ),
            onChanged: (newValue) {
              bookTableController.setBookTableSelectedPartySize(newValue);
              print(newValue);
            },
            //value: _filterController.selectedFoodType,
            value: bookTableController.selectedBookTablePartySize,
            items: bookTableController.bookTablePartySize.isNotEmpty
                ? bookTableController.bookTablePartySize.map((PartySize value) {
              return DropdownMenuItem<PartySize>(
                value: value,
                child: Text(value.number!.toString()),
              );
            }).toList()
                : []),
      );
    });
  }
}
