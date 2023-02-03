import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../controller/reservation & rating/reservation_controller.dart';
import '../../../utils/common/widgets_methods/common_sized_box.dart';

class ReservationReviewList extends StatelessWidget {
  ReservationReviewList({Key? key}) : super(key: key);
  ReservationController reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1,
          width: Get.width,
          color: whiteE5E5E5,
        ),
        CommonSizedBox(
          height: 20,
        ),
        CommonText(
          text: 'Reviews',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        CommonSizedBox(
          height: 20,
        ),
        reservationController
                    .bookRestaurantDetails!.bookinglistresponse.reviewList ==
                null
            ? CommonText(
                text: "No Review Submitted!",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: black0D0000,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    softWrap: true,
                    text: reservationController.bookRestaurantDetails!
                                .bookinglistresponse.reviewList!.review ==
                            null
                        ? ""
                        : reservationController.bookRestaurantDetails!
                            .bookinglistresponse.reviewList!.review
                            .toString(),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  CommonSizedBox(
                    height: 15,
                  ),
                  RatingBarIndicator(
                    //   minRating: 0,
                    itemSize: 15,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    rating: reservationController.bookRestaurantDetails!
                        .bookinglistresponse.reviewList!.rating!
                        .toDouble(),
                  ),
                ],
              )
      ],
    );
  }
}
