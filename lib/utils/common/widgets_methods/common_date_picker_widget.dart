import 'package:booking_table/utils/common/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonDatePicker extends StatelessWidget {
  final TextEditingController? controller;

  const CommonDatePicker({Key? key, this.controller}) : super(key: key);

//   @override
//   State<CommonDatePicker> createState() => _CommonDatePickerState();
// }
//
// class _CommonDatePickerState extends State<CommonDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 8, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: greyF5F5F5),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: black000000,
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "dd-mm-yy",
            hintStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: textGrey868686,
            ),
            suffixIcon: IconButton(
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: redE2211C, // <-- SEE HERE
                            // onPrimary: Colors.redAccent, // <-- SEE HERE
                            // onSurface: Colors.blueAccent, // <-- SEE HERE
                          ),
                          // textButtonTheme: TextButtonThemeData(
                          //   style: TextButton.styleFrom(
                          //     primary: Colors.red, // button text color
                          //   ),
                          // ),
                        ),
                        child: child!,
                      );
                    },
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now());
                if (picked != null) {
                  controller!.text = DateFormat('dd-MM-yyyy').format(picked);
                }
              },
              icon: const Icon(
                Icons.calendar_month_outlined,
                color: redE2211C,
                size: 25,
              ),
            )),
      ),
    );
  }
}
