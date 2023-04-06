import 'package:booking_table/model/book_table_modals/party_size_list_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/filter/filter_screen_controller.dart';
import '../../../utils/common/common_strings.dart';

class PartySizeDropDown extends StatelessWidget {
  const PartySizeDropDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterViewController>(builder: (filterViewController) {
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
              filterViewController.setSelectedPartySize(newValue);
              print(newValue);
            },
            //value: _filterController.selectedFoodType,
            value: filterViewController.selectedPartySize,
            items: filterViewController.partySize.isNotEmpty
                ? filterViewController.partySize.map((PartySize value) {
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
