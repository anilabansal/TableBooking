import 'package:booking_table/utils/common/common_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/filter/filter_screen_controller.dart';
import '../../../utils/common/widgets_methods/common_text_form_field.dart';

class FilterScreenDatePicker extends StatelessWidget {
  final TextEditingController? controller;
  final bool? enable;
  final Color? fillColor;

  FilterScreenDatePicker(
      {Key? key, this.enable, this.controller, this.fillColor})
      : super(key: key);
  FilterViewController filterViewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: fillColor,
      ),
      child: InkWell(
        onTap: () async {
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
            // controller!.text = DateFormat('dd/MM/yyyy').format(picked);
            // filterViewController.dateSelected.value = DateFormat('yyyy-MM-dd').format(picked);
            // controller!.text = DateFormat('yyyy-MM-dd').format(picked);
            controller!.text = DateFormat('MM-dd-yyyy').format(picked);
            loadAllTimeList();
            // filterViewController.getAvailableTime(body: {
            //   "Date":
            //       "${controller!.text} ${DateFormat('kk:mm').format(DateTime.now()).toString()}"
            // }).then((value){
            //   print("selectedDate---->${controller!.text} ${DateFormat('kk:mm').format(DateTime.now()).toString()}");
            // });
          }
        },
        child: CommonTextFormField(
          enable: enable,
          controller: controller,
          hintText: "mm-dd-yyyy",
          // hintText: "yyyy-MM-dd",
          filled: true,
          suffixIcon: IconButton(
            onPressed: () async {},
            icon: const Icon(
              Icons.calendar_month_outlined,
              color: redE2211C,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  loadAllTimeList() {
    filterViewController.isSelectedTimeLoading.value = true;
    filterViewController.getAvailableTime(
      body: {
        //"Date":DateTime.now(),
        "Date":
            "${DateFormat('yyyy-MM-dd').format(DateFormat('MM-dd-yyyy').parse(controller!.text))} ${DateFormat('kk:mm').format(DateTime.now()).toString()}"
      },
    ).then(
      (value) {
        if (value) {
          filterViewController.isSelectedTimeLoading.value = false;
          print(
              "currentTime ----> ${DateFormat('yyyy-MM-dd kk:mm').format(DateTime.now().toUtc())}");
        }
      },
    );
  }
}
