import 'package:booking_table/utils/common/widgets_methods/progress_loader.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../controller/reservation & rating/reservation_controller.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/common/widgets_methods/common_button.dart';
import '../../utils/common/widgets_methods/common_sized_box.dart';
import '../../utils/common/widgets_methods/common_text.dart';
import '../../utils/common/widgets_methods/common_text_form_field.dart';

class RateReviewView extends StatelessWidget {
  RateReviewView({Key? key}) : super(key: key);
  ReservationController reservationController = Get.find();
  var data = Get.arguments;
  var reviewController = TextEditingController();
  var ratingGiven;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BODY
      // body: RateReviewBody(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // CommonSizedBox(
              //   height: 50,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.close,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // data[0]["restaurantPic"]==null?
              // Image.asset(
              //     bookATableImage,
              //     height: 112,
              //     width: 112,
              //   ),
              Container(
                height: 112,
                width: 112,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: data[0]["restaurantPic"] == null
                      ? const DecorationImage(
                          image: AssetImage(bookATableImage),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: NetworkImage(data[0]["restaurantPic"]),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              CommonSizedBox(
                height: 30,
              ),
              CommonText(
                text: 'How was your experience with',
                color: textDark3F3E3E,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              CommonSizedBox(
                height: 6,
              ),
              CommonText(
                text: data[0]["restaurantName"],
                color: black000000,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              CommonSizedBox(
                height: 40,
              ),
              CommonText(
                text: 'Your feedback matters',
                color: textLight868686,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              CommonSizedBox(
                height: 15,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                unratedColor: whiteDBDBDB,
                glowColor: yellowFFC107,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // if (kDebugMode) {
                  //   print("rating--->$rating");
                  //   print(Get.height);
                  // }
                  ratingGiven = rating;
                  print("rating--->$ratingGiven");
                },
              ),
              CommonSizedBox(
                height: 60,
              ),
              CommonText(
                text: 'Leave a Review',
                color: black000000,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              CommonSizedBox(
                height: 15,
              ),
              CommonTextFormField(
                hintText: 'Type Here...',
                filled: true,
                fillColor: whiteF5F5F5,
                maxLines: 10,
                controller: reviewController,
              ).paddingSymmetric(
                horizontal: 22,
              ),
              CommonSizedBox(
                height: 48,
              ),
              CommonButton(
                onTap: () {
                  if (validation() != '') {
                    ShowToast.show(
                      msg: validation(),
                      isError: true,
                    );
                  } else {
                    reservationController.isReviewSubmittedLoader.value = true;
                    ProgressDialog.showProgressDialog(context);
                    reservationController.submitReviewApiCall(body: {
                      "RatingToRestaurantId": data[0]["restaurantId"],
                      ""
                          "BookingId": data[0]["bookingId"],
                      "Rating": ratingGiven,
                      "Reviews": reviewController.text.trim() == null ||
                              reviewController.text.trim() == ''
                          ? ""
                          : reviewController.text.trim()
                    }).then((value) {
                      reservationController.isReviewSubmittedLoader.value =
                          false;
                      Navigator.pop(context);

                      if (value) {
                        Get.offNamed(
                          '/previous-booking',
                          arguments: [
                            {"BookingId": data[0]["bookingId"]}
                          ],
                        );
                        reservationController.reservationBookingRestaurantsApiCall();
                      }
                    });
                  }
                },
                text: 'Submit',
                bgColor: redE2211C,
                textColor: Colors.white,
              ).paddingAll(22),
            ],
          ),
        ),
      ),
    );
  }

  validation() {
    if (ratingGiven == 0.0 || ratingGiven == null) {
      return 'please give rating!'.toTitleCase();
    }
   else if (reviewController.text.trim().isEmpty) {
      return 'please give review!'.toTitleCase();
    }
    else {
      return '';
    }
  }
}
