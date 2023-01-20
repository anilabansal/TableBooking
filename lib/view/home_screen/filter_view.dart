import 'package:booking_table/controller/filter/filter_screen_controller.dart';
import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/progress_loader.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:booking_table/view/home_screen/widgets/filter_screen_date_picker.dart';
import 'package:booking_table/view/home_screen/widgets/filter_select_time.dart';
import 'package:booking_table/view/home_screen/widgets/party_size_drop_down.dart';
import 'package:booking_table/view/home_screen/widgets/type_of_food_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/location/location_controller.dart';
import '../../controller/user_session/user_session_controller.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/common/widgets_methods/common_app_bar.dart';
import '../../utils/common/widgets_methods/common_button.dart';
import '../../utils/common/widgets_methods/common_info_icon.dart';
import '../../utils/common/widgets_methods/common_text.dart';

class FilterView extends StatefulWidget {
  const FilterView({Key? key}) : super(key: key);
  @override
  State<FilterView> createState() => _FilterViewState();
}
class _FilterViewState extends State<FilterView> {
  HomeController homeController = Get.put(HomeController());
  final dateController = TextEditingController();
  // ReservationController reservationController = Get.find();
  FilterViewController filterViewController = Get.find();
  var typesOfServicesController = TextEditingController();
  var partySizeController = TextEditingController();
  UserSessionController userSessionController = Get.find();
  LocationController locationController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    loadFoodList();
    loadAllPartySizeList();
    // loadAllTimeList();
    filterViewController.setSelected(null);
    filterViewController.setSelectedFilterTime(null);
    filterViewController.setSelectedPartySize(null);
    homeController.serviceType.value = "0";
    super.initState();
  }

  loadFoodList() {
    filterViewController.isTypeFoodLoading.value = true;
    filterViewController.typesOfFood().then(
      (value) {
        if (value) {
          filterViewController.isTypeFoodLoading.value = false;
        }
      },
    );
  }
  loadAllPartySizeList(){
    filterViewController.partySizeIsLoading.value = true;
    filterViewController.getPartySize().then((value){
      if(value){
        filterViewController.partySizeIsLoading.value = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(text: "Filter"),
      body: SingleChildScrollView(
        child: GetBuilder<HomeController>(
          builder: (homeController) {
            return Obx(
              () {
                return filterViewController.isTypeFoodLoading.value &&
                        filterViewController.partySizeIsLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: redE2211C,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "Date",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: black000000,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // CommonDatePicker(
                              //   enable: false,
                              //   controller: dateController,
                              //   //fillColor: greyF5F5F5,
                              // ),
                              FilterScreenDatePicker(
                                enable: false,
                                //controller: filterViewController.dateController,
                                controller: dateController,
                                //fillColor: greyF5F5F5,
                              ),
                            ],
                          ).paddingOnly(top: 15, left: 22, right: 22),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(lineImage),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "Time",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: black000000,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              selectFilterTime()
                            ],
                          ).paddingOnly(left: 22, right: 22),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(lineImage),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "Party Size",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: black000000,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // CommonTextFormField(
                              //   hintText: "None".toTitleCase(),
                              //   filled: true,
                              //   fillColor: greyF4F4F4,
                              //   controller: partySizeController,
                              // ),
                              const PartySizeDropDown(),
                            ],
                          ).paddingOnly(left: 22, right: 22),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(lineImage),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "Type of Service",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: black000000,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  typeServiceContainer(
                                    "Full",
                                    "1",
                                    // ignore: unrelated_type_equality_checks
                                    homeController.serviceType.value == "1",
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  // ignore: unrelated_type_equality_checks
                                  typeServiceContainer(
                                    "Mid",
                                    "2",
                                    homeController.serviceType.value == "2",
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  // ignore: unrelated_type_equality_checks
                                  typeServiceContainer(
                                    "No",
                                    "3",
                                    homeController.serviceType.value == "3",
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  // ignore: unrelated_type_equality_checks
                                  typeServiceContainer(
                                    "To Go",
                                    "4",
                                    homeController.serviceType.value == "4",
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Visibility(
                                visible: homeController
                                        .serviceType.value.isNotEmpty &&
                                    homeController.serviceType.value != "0",
                                child: Row(
                                  children: [
                                    const InfoIcon(),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: CommonText(
                                        softWrap: true,
                                        text: homeController
                                                    .serviceType.value ==
                                                "1"
                                            ? "Order with server in restaurant"
                                            : homeController
                                                        .serviceType.value ==
                                                    "3"
                                                ? "Pre order food and drink on the app as well as in restaurant. No server."
                                                : homeController.serviceType
                                                            .value ==
                                                        "4"
                                                    ? "Order food/drink to go"
                                                    : "Pre-order food/drink via the app and have a server in restaurant",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: textGrey868686,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ).paddingOnly(
                            left: 22,
                            right: 22,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(lineImage),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CommonText(
                                    text: "Type of Food ",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: black000000,
                                    textAlign: TextAlign.start,
                                  ),
                                  CommonText(
                                    text: "(optional) ",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: textDark3F3E3E,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              selectFoodType()
                            ],
                          ).paddingOnly(left: 22, right: 22),
                          const SizedBox(
                            height: 20,
                          ),
                          CommonButton(
                            onTap: () async {
                              if (validateFields() != '') {
                                ShowToast.show(
                                  msg: validateFields(),
                                  isError: true,
                                );
                                return false;
                              }
                              ProgressDialog.showProgressDialog(context);
                              filterViewController.isLoading.value = true;
                              await filterViewController
                                  .filterSearchResults(
                                body: userSessionController.isLogin == true
                                    ? {
                                        "ServiceId": homeController
                                            .serviceType.value
                                            .trim(),
                                        // "Date": dateController.value.text
                                        //     .trim()
                                        //     .toString(),
                                        "Date": DateFormat('MM/dd/yyyy').format(
                                          DateFormat('dd-MM-yyyy')
                                              .parse(dateController.value.text),
                                        ),
                                        // "Date": "01/12/2022",
                                        // "PartySize": partySizeController
                                        //     .value.text
                                        //     .trim()
                                        //     .toString(),
                                  "PartySize": filterViewController.selectedPartySize!.number.toString(),
                                        "StartTimeSlotId": DateFormat('HH:mm')
                                            .format(
                                              DateFormat("hh:mm a").parse(
                                                filterViewController
                                                    .selectedFilterTime!
                                                    .startTime
                                                    .toString(),
                                              ),
                                            )
                                            .toString(),
                                        // "StartTimeSlotId": "4:00",
                                        "EndTimeSlotId": DateFormat('HH:mm')
                                            .format(
                                              DateFormat("hh:mm a").parse(
                                                filterViewController
                                                    .selectedFilterTime!.endTime
                                                    .toString(),
                                              ),
                                            )
                                            .toString(),
                                        // "EndTimeSlotId": "5:00",
                                        // "FoodTypeId": filterViewController
                                        //     .selectedFoodType!.id
                                        //     .toString(),
                                        "FoodTypeId": filterViewController
                                                    .selectedFoodType ==
                                                null
                                            ? 0
                                            : filterViewController
                                                .selectedFoodType!.id
                                                .toString(),
                                        // "FoodTypeId":0,
                                        // "ServiceId":1,
                                        // "Date": "12/01/2022",
                                        // "PartySize":4,
                                        // "StartTimeSlotId":"4:00",
                                        // "EndTimeSlotId":"5:00",
                                        // "FoodTypeId":2
                                      }
                                    : {
                                        "Latitude": locationController
                                            .latLng.value.latitude,
                                        "Longitude": locationController
                                            .latLng.value.longitude,
                                        "ServiceId": homeController
                                            .serviceType.value
                                            .trim(),
                                        "Date": DateFormat('MM/dd/yyyy').format(
                                          DateFormat('dd-MM-yyyy')
                                              .parse(dateController.value.text),
                                        ),
                                        // "PartySize": partySizeController
                                        //     .value.text
                                        //     .trim()
                                        //     .toString(),
                                  "PartySize": filterViewController
                                            .selectedPartySize!.number
                                            .toString(),
                                        "StartTimeSlotId": DateFormat('HH:mm')
                                            .format(
                                              DateFormat("hh:mm a").parse(
                                                filterViewController
                                                    .selectedFilterTime!
                                                    .startTime
                                                    .toString(),
                                              ),
                                            )
                                            .toString(),
                                        "EndTimeSlotId": DateFormat('HH:mm')
                                            .format(
                                              DateFormat("hh:mm a").parse(
                                                filterViewController
                                                    .selectedFilterTime!.endTime
                                                    .toString(),
                                              ),
                                            )
                                            .toString(),
                                        "FoodTypeId": filterViewController
                                                    .selectedFoodType ==
                                                null
                                            ? 0
                                            : filterViewController
                                                .selectedFoodType!.id
                                                .toString(),
                                      },
                              )
                                  .then(
                                (value) {
                                  Navigator.pop(context);
                                  filterViewController.isLoading.value = false;
                                  if (value) {
                                    Get.toNamed('/filter-result-screen');
                                  } else {
                                    Navigator.pop(context);
                                  }
                                  return;
                                },
                              );
                            },
                            text: "Apply",
                            bgColor: redE2211C,
                            textColor: white,
                          ).paddingOnly(left: 22, right: 22),
                          CommonSizedBox(
                            height: 20,
                          ),
                        ],
                      );
              },
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
          homeController.serviceType.value = index;
          homeController.update();
          print(homeController.serviceType.value);
          // isSelected = !isSelected;
        },
        child: Container(
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isSelected ? black0D0000 : greyF8F8F8,
          ),
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
    if (dateController.text.trim().isEmpty) {
      return "please enter valid booking date!".toTitleCase();
    } else if (filterViewController.selectedFilterTime == null ||
        filterViewController.selectedFilterTime == '') {
      return 'please select time!'.toTitleCase();
    } else if (filterViewController.selectedPartySize==null||filterViewController.selectedPartySize=='') {
      return 'please select party size!'.toTitleCase();
    } else if (homeController.serviceType.value.trim().isEmpty) {
      return "please select service type!".toTitleCase();
    }
    // else if (filterViewController.selectedFoodType == null ||
    //     filterViewController.selectedFoodType == '') {
    //   return "please select type of food!".toTitleCase();
    // }

    // else if (_profileController.mobileNumberController.value.text.isEmpty) {
    //   return 'please enter your mobile Number!'.toTitleCase();
    // }
    return '';
  }
}
