import 'package:booking_table/utils/common/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/filter/filter_screen_controller.dart';
import '../../../model/filter_select_time.dart';
import '../../../utils/common/common_strings.dart';

selectFilterTime() {
  return GetBuilder<FilterViewController>(builder: (filterViewController) {
    return InkWell(
      onTap: () {
        filterViewController.selectTime.isEmpty
            ? ShowToast.show(
                msg: "Please Select Date First",
                isError: true,
              )
            : null;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: greyF5F5F5,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 12,
        ),
        width: Get.width,
        child: DropdownButton<FilterSelectTime>(
            isExpanded: true,
            underline: const SizedBox(),
            borderRadius: BorderRadius.zero,
            hint: const Text(
              'Select Time',
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: black000000,
              size: 25,
            ),
            onChanged: (newValue) {
              filterViewController.setSelectedFilterTime(newValue);
              print(newValue);
            },
            //value: _filterController.selectedFoodType,
            value: filterViewController.selectedFilterTime,
            items: filterViewController.selectTime.isNotEmpty
                ? filterViewController.selectTime.map((FilterSelectTime value) {
                    return DropdownMenuItem<FilterSelectTime>(
                      value: value,
                      child: Row(
                        children: [
                          Text(value.startTime!),
                          //  const SizedBox(width: 8,),
                          const Text("-"),
                          Text(value.endTime!),
                        ],
                      ),
                    );
                  }).toList()
                : []),
      ),
    );
  });
}
