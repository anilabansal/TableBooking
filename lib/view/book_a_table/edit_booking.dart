import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:booking_table/view/book_a_table/widget/book_a_table_date_picker.dart';
import 'package:booking_table/view/book_a_table/widget/book_table_select_time_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/book_a_table/book_a_table_controller.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/common/widgets_methods/common_app_bar.dart';
import '../../utils/common/widgets_methods/common_button.dart';
import '../../utils/common/widgets_methods/common_sized_box.dart';
import '../../utils/common/widgets_methods/common_text.dart';
import '../../utils/common/widgets_methods/common_text_form_field.dart';
import '../../utils/common/widgets_methods/progress_loader.dart';
import '../../utils/common/widgets_methods/restaurant_name_distance.dart';

class EditBooking extends StatefulWidget {
  const EditBooking({Key? key}) : super(key: key);
  @override
  State<EditBooking> createState() => _EditBookingState();
}

class _EditBookingState extends State<EditBooking> {
  //BookATableController bookingTable = Get.find();
  final dateController = TextEditingController();
  var typesOfServicesController = TextEditingController();
  var partySizeController = TextEditingController();
  String? selectedTime;
  var data = Get.arguments;
  var isFirstCome = false;
  BookATableController bookingTable = Get.put(BookATableController());

  @override
  void initState() {
    // TODO: implement initState
    editBookApiCall();
    super.initState();
  }

  editBookApiCall() {
    bookingTable.editTableIsLoading.value = true;
    bookingTable
        .editBookTableApiCall(body: {"BookingId": data[0]["bookingId"]}).then(
      (value) {
        if (value) {
          initialStoreData();
          bookingTable.editTableIsLoading.value = false;
        }
      },
    );
  }

  initialStoreData() {
    if (!isFirstCome) {
      isFirstCome = true;
      dateController.text = (bookingTable.editBookingResponse!.bookingDate)!
          .convertEditBookingDateToFormat();
      partySizeController.text =
          bookingTable.editBookingResponse!.partySize.toString();
      bookingTable.serviceType.value =
          bookingTable.editBookingResponse!.serviceType.toString();
      selectedTime =
          "${DateFormat('h:mm a').format(DateFormat('h:mm:ss').parse(bookingTable.editBookingResponse!.bookingSlotStartTime.toString()))}-${DateFormat('h:mm a').format(DateFormat('h:mm:ss').parse(bookingTable.editBookingResponse!.bookingSlotEndTime.toString()))}";
      //    bookingTable.setSelectedBookTime(bookingTable.editBookingResponse!.bookingSlotStartTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appBarCommon(text: 'Book a Table'),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return bookingTable.editTableIsLoading.value
                ?
            const Center(
                    child: CircularProgressIndicator(
                      color: redE2211C,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonRestaurantNameDistance(
                        restaurantName: data[0]['restaurantName'],
                        restaurantDistance: data[0]['restaurantDistance'],
                        restaurantPic: data[0]['restaurantPic'],
                      ),
                      Container(
                        width: Get.width,
                        height: 1,
                        color: whiteE5E5E5,
                      ).paddingOnly(
                        top: 20,
                        bottom: 20,
                      ),

                      // Date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: 'Date',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          CommonSizedBox(
                            height: 15,
                          ),
                          BookTableDatePicker(
                            controller: dateController,
                            restaurantId: data[0]['restaurantId'],
                            bookingId:
                                bookingTable.editBookingResponse!.bookingId,
                          ),
                        ],
                      ).paddingOnly(
                        left: 20,
                        right: 20,
                      ),
                      Container(
                        width: Get.width,
                        height: 1,
                        color: whiteE5E5E5,
                      ).paddingOnly(
                        top: 20,
                        bottom: 20,
                        left: 0,
                        right: 0,
                      ),
                      //time
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: 'Time',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          CommonSizedBox(
                            height: 15,
                          ),
                          selectBookTableTime(
                            CommonText(
                              text: selectedTime,
                              color: black000000,
                            ),
                          ),
                          // selectBookTableTime(const Text('Select Time')),
                        ],
                      ).paddingOnly(
                        left: 20,
                        right: 20,
                      ),
                      Container(
                        width: Get.width,
                        height: 1,
                        color: whiteE5E5E5,
                      ).paddingOnly(
                        top: 20,
                        bottom: 20,
                      ),
                      // Party SIze
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: 'Party Size',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          CommonSizedBox(
                            height: 15,
                          ),
                          // CommonTextFormField(
                          //   controller: controller.partySize,
                          //   color: whiteF5F5F5,
                          //   keyboardType: TextInputType.number,
                          //   maxLength: 2,
                          // ),
                          // const CommonTextField(
                          //   hint: "",
                          // ),
                          CommonTextFormField(
                            hintText: "5",
                            filled: true,
                            fillColor: greyF5F5F5,
                            controller: partySizeController,
                          ),
                        ],
                      ).paddingOnly(
                        left: 20,
                        right: 20,
                      ),
                      Container(
                        width: Get.width,
                        height: 1,
                        color: whiteE5E5E5,
                      ).paddingOnly(
                        top: 20,
                        bottom: 20,
                      ),

                      //  Field Four
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: 'Types of Services',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          CommonSizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              typeServiceContainer(
                                "Full",
                                "1",
                                // ignore: unrelated_type_equality_checks
                                // bookingTable.serviceType.value == "1",
                                bookingTable.serviceType.value == "1",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              // ignore: unrelated_type_equality_checks
                              typeServiceContainer(
                                "Mid",
                                "2",
                                bookingTable.serviceType.value == "2",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              // ignore: unrelated_type_equality_checks
                              typeServiceContainer(
                                "No",
                                "3",
                                bookingTable.serviceType.value == "3",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              // ignore: unrelated_type_equality_checks
                              typeServiceContainer(
                                "To Go",
                                "4",
                                bookingTable.serviceType.value == "4",
                              ),
                            ],
                          ),
                          CommonSizedBox(
                            height: 15,
                          ),
                          Visibility(
                            visible: bookingTable.serviceType.isNotEmpty,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                                CommonSizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CommonText(
                                    softWrap: true,
                                    text: bookingTable.serviceType.value == "1"
                                        ? "Order with server in restaurant"
                                        : bookingTable.serviceType.value == "3"
                                            ? "Pre-order food/drink and any add-ons in restaurant via the app. No server"
                                            : bookingTable.serviceType.value ==
                                                    "4"
                                                ? "Order food/drink to go"
                                                : "Pre-order food/drink via the app and have a server in restaurant",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: textGrey868686,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CommonSizedBox(
                            height: 31,
                          ),
                          // Button
                          CommonButton(
                            onTap: () {
                              if (validateFields() != '') {
                                ShowToast.show(
                                  msg: validateFields(),
                                  isError: true,
                                );
                                return false;
                              }
                              ProgressDialog.showProgressDialog(context);
                              bookingTable.updateTableBookIsLoading.value ==
                                  true;
                              bookingTable.updateBookTableApiCall(body: {
                                "BookingDate": dateController.text.trim(),
                                "BookingTime": bookingTable
                                                .selectedBookTableTime ==
                                            null ||
                                        bookingTable.selectedBookTableTime == ''
                                    ? bookingTable.editBookingResponse!
                                        .bookingSlotStartTime
                                    : DateFormat('HH:mm').format(
                                        DateFormat("hh:mm a").parse(
                                          bookingTable
                                              .selectedBookTableTime!.startTime
                                              .toString(),
                                        ),
                                      ),
                                "PartySize": partySizeController.text.trim(),
                                "ServiceType": bookingTable.serviceType.value,
                                "BookingId":
                                    bookingTable.editBookingResponse!.bookingId
                              }).then(
                                (value) {
                                  Navigator.pop(context);
                                  if (value) {
                                    // Navigator.pop(context);
                                    Get.offNamed(
                                      '/full-service',
                                      arguments: [
                                        {
                                          "restaurantId": data[0]
                                              ['restaurantId'],
                                          "restaurantName": data[0]
                                              ["restaurantName"],
                                          "restaurantPic": data[0]
                                              ["restaurantPic"],
                                          "restaurantDistance": data[0]
                                              ["restaurantDistance"],
                                        }
                                      ],
                                    );
                                    // Get.back();
                                  }
                                },
                              );
                            },
                            textColor: Colors.white,
                            bgColor: redE2211C,
                            text: 'Proceed',
                          ),
                          CommonSizedBox(
                            height: 31,
                          ),
                        ],
                      ).paddingOnly(
                        left: 20,
                        right: 20,
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  typeServiceContainer(text, index, isSelected) {
    return Expanded(
      child: InkWell(
        onTap: () {
          bookingTable.serviceType.value = index;
          //controller.serviceType.value = text;
          bookingTable.update();
          // isSelected = !isSelected;
        },
        child: Container(
          width: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: isSelected ? black0D0000 : greyF8F8F8),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: CommonText(
                text: text,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: isSelected ? white : greyA2A2A2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  validateFields() {
    if (partySizeController.text.trim().isEmpty) {
      return 'please enter party size!'.toTitleCase();
    } else if (bookingTable.serviceType.value.trim().isEmpty) {
      return "please select service type!".toTitleCase();
    }
    // else if (controller.selectedFoodType == null ||
    //     controller.selectedFoodType == '') {
    //   return "please select type of food!".toTitleCase();
    // }

    // else if (_profileController.mobileNumberController.value.text.isEmpty) {
    //   return 'please enter your mobile Number!'.toTitleCase();
    // }
    return '';
  }
}
