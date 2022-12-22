import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/filter/filter_screen_controller.dart';
import '../../../model/types_food_list.dart';
import '../../../utils/common/common_strings.dart';

selectFoodType() {
  return GetBuilder<FilterViewController>(
    builder: (filterViewController) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: greyF5F5F5,
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 5, horizontal: 12,),
        width: Get.width,
        child: DropdownButton<TypesOfFood>(
          isExpanded: true,
            underline: const SizedBox(),
          borderRadius: BorderRadius.zero,
          hint: const Text(
            'Select Type',
          ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: black000000,
              size: 25,
            ),
          onChanged: (newValue) {
            filterViewController.setSelected(newValue);
            print(newValue);
          },
          //value: _filterController.selectedFoodType,
          value: filterViewController.selectedFoodType,
          items:filterViewController.typesOfFoodFilterData.isNotEmpty? filterViewController.typesOfFoodFilterData
              .map((TypesOfFood value) {
            return DropdownMenuItem<TypesOfFood>(
                value: value,
                child: Text(
                value.foodType!
            ),); }).toList():[]


        ),
      );
    }
  );
}