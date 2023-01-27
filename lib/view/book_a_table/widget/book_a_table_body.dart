import 'package:booking_table/controller/book_a_table/book_a_table_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/common/widgets_methods/progress_loader.dart';
import 'package:booking_table/utils/common/widgets_methods/restaurant_name_distance.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/filter/filter_screen_controller.dart';
import '../../../controller/restaurant_details/restaurant_details_controller.dart';
import '../../../utils/common/toast_message.dart';
import '../../home_screen/widgets/party_size_drop_down.dart';
import 'book_a_table_date_picker.dart';
import 'book_table_select_time_drop_down.dart';

class BookATableBody extends StatefulWidget {
  const BookATableBody({
    Key? key,
  }) : super(key: key);

  @override
  State<BookATableBody> createState() => _BookATableBodyState();
}

class _BookATableBodyState extends State<BookATableBody> {
  // final controller = Get.put(BookATableController());
  final dateController = TextEditingController();
  var typesOfServicesController = TextEditingController();
  var partySizeController = TextEditingController();
  var data = Get.arguments;
  BookATableController bookingTable = Get.find();
  RestaurantDetailsController restaurantDetailsController = Get.find();
  FilterViewController filterViewController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    loadAllPartySizeList();
    filterViewController.setSelectedPartySize(null);
    super.initState();
  }

  loadAllPartySizeList() {
    filterViewController.partySizeIsLoading.value = true;
    filterViewController.getPartySize().then((value) {
      if (value) {
        filterViewController.partySizeIsLoading.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child:
            // bookingTable.isTimeLoading.value
            //     ? const CircularProgressIndicator()
            //     :
            // bookingTable.selectTime.isEmpty
            //          ? Text("No table available!")
            //          :
            filterViewController.partySizeIsLoading.value
                ? const Center(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              // const CommonDatePicker(
                              //   //fillColor: greyF5F5F5,
                              // )
                              BookTableDatePicker(
                                controller: dateController,
                                restaurantId: data[0]['restaurantId'],
                                bookingId: 0,
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
                          // Time
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
                              // const CommonTextField(
                              //   hint: "09:00 PM",
                              // ),
                              // CommonTextFormField(
                              //   hintText: "09:00 PM",
                              //   filled: true,
                              //   fillColor: greyF5F5F5,
                              //   fontSize: 16,
                              //   fontWeight: FontWeight.w400,
                              // ),
                              selectBookTableTime(const Text('Select Time')),
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
                              // CommonTextFormField(
                              //   hintText: "5",
                              //   filled: true,
                              //   fillColor: greyF5F5F5,
                              //   controller: partySizeController,
                              // ),
                              const PartySizeDropDown(),
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
                                        text: bookingTable.serviceType.value ==
                                                "1"
                                            ? "Order with server in restaurant"
                                            : bookingTable.serviceType.value ==
                                                    "3"
                                                ? "Pre order food and drink on the app as well as in restaurant. No server."
                                                : bookingTable.serviceType
                                                            .value ==
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
                                  if (bookingTable.selectTimeList.isNotEmpty) {
                                    //  Get.toNamed('/full-service');
                                    if (validateFields() != '') {
                                      ShowToast.show(
                                        msg: validateFields(),
                                        isError: true,
                                      );
                                      return false;
                                    }
                                    ProgressDialog.showProgressDialog(context);
                                    bookingTable.bookTableIsLoading.value =
                                        true;
                                    bookingTable.bookTableApiCall(body: {
                                      "RestaurantId": data[0]['restaurantId'],
                                      "BookingDate":
                                          DateFormat('yyyy-MM-dd').format(
                                        DateFormat('MM-dd-yyyy')
                                            .parse(dateController.value.text),
                                      ),
                                      // "BookingDate": dateController.text,
                                      //   "BookingTime":bookingTable.selectedBookTableTime!.startTime,
                                      // "PartySize": partySizeController.text.trim(),
                                      "PartySize": filterViewController
                                          .selectedPartySize!.number
                                          .toString(),
                                      "ServiceType":
                                          bookingTable.serviceType.value,
                                      "BookingTime": DateFormat('HH:mm').format(
                                        DateFormat("hh:mm a").parse(
                                          bookingTable
                                              .selectedBookTableTime!.startTime
                                              .toString(),
                                        ),
                                      ),
                                    }).then(
                                      (value) {
                                        Navigator.pop(context);
                                        bookingTable.bookTableIsLoading.value =
                                            false;
                                        if (value) {
                                          Get.toNamed(
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
                                        }
                                        restaurantDetailsController
                                            .cartItemsList
                                            .clear();
                                        restaurantDetailsController
                                            .subTotalPrice = 0.0;
                                        for (int i = 0;
                                            i <
                                                restaurantDetailsController
                                                    .menuHeaderRestaurantList
                                                    .length;
                                            i++) {
                                          for (int j = 0;
                                              j <
                                                  restaurantDetailsController
                                                      .menuHeaderRestaurantList[
                                                          i]
                                                      .menu!
                                                      .length;
                                              j++) {
                                            restaurantDetailsController
                                                .menuHeaderRestaurantList[i]
                                                .menu![j]
                                                .quantity = 0;
                                            print(
                                                'quantityCount---->${restaurantDetailsController.menuHeaderRestaurantList[i].menu![j].quantity}');
                                          }
                                        }
                                        // restaurantDetailsController
                                        //     .menuHeaderRestaurantList
                                        //     .map((element) => element.menu!
                                        //         .map((e) => e.quantity = 0));
                                        print(
                                            'cartList---->${restaurantDetailsController.cartItemsList.length}');
                                      },
                                    );
                                  } else if (bookingTable
                                      .selectTimeList.isEmpty) {
                                    return false;
                                  }
                                },
                                textColor: Colors.white,
                                bgColor: bookingTable.selectTimeList.isEmpty
                                    ? red26E2211C
                                    : redE2211C,
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
                      ),
                    ],
                  ),
      ),
    );

    // );
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
    if (bookingTable.selectedBookTableTime == null ||
        bookingTable.selectedBookTableTime == '') {
      return 'please select time!'.toTitleCase();
    }
    // else if (partySizeController.text.trim().isEmpty) {
    //   return 'please enter party size!'.toTitleCase();
    // }
    else if (filterViewController.selectedPartySize == null ||
        filterViewController.selectedPartySize == '') {
      return 'please select party size!'.toTitleCase();
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
