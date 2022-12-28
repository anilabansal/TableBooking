import 'package:booking_table/utils/common/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/book_a_table/book_a_table_controller.dart';
import '../../../model/filter_select_time.dart';
import '../../../utils/common/common_strings.dart';


selectBookTableTime() {
  return GetBuilder<BookATableController>(builder: (bookTableController) {
    return InkWell(
      onTap: () {
        bookTableController.selectTime.isEmpty
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
              bookTableController.setSelectedBookTime(newValue);
              print(newValue);
            },
            //value: _filterController.selectedFoodType,
            value: bookTableController.selectedBookTableTime,
            items: bookTableController.selectTime.isNotEmpty
                ? bookTableController.selectTime.map(
                    (FilterSelectTime value) {
                      return DropdownMenuItem<FilterSelectTime>(
                        value: value,
                        child:  Row(
                          children: [
                            Text(value.startTime!),
                            const Text("-"),
                            Text(value.endTime!),
                          ],
                        ),
                        // child: Row(
                        //   children: [
                        //     // Checkbox(
                        //     //   onChanged: (newValue) {
                        //     //   // this.value = newValue;
                        //     //   //   value = value;
                        //     //   //   bookTableController.isTimeChecked.value = !bookTableController.isTimeChecked.value;
                        //     //  //  bookTableController.updateCheckbox(newValue);
                        //     //     // if(bookTableController.isTimeChecked.value == true){
                        //     //     //   // value = value;
                        //     //     //   bookTableController.setSelectedBookTime(value);
                        //     //     // }
                        //     //   },
                        //     //   value:false,
                        //     // ),
                        //
                        //     Text(value.startTime!),
                        //     //  const SizedBox(width: 8,),
                        //     const Text("-"),
                        //     Text(value.endTime!),
                        //   ],
                        // ),
                      );
                    },
                  ).toList()
                : []),
      ),
    );
  });
}
