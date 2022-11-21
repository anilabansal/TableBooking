import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/no_data_found.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ReviewsTabScreen extends StatelessWidget {
  const ReviewsTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDetailsController>(
      builder: (controller) {
        return controller.totalReviews.value != "0"
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: "${controller.totalReviews.value} Reviews",
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: black000000,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.rateReviewsRestaurantList.length,
                      shrinkWrap: true,
                      //physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return reviewsWidget(
                          controller
                              .rateReviewsRestaurantList[index].profilePic,
                          controller
                              .rateReviewsRestaurantList[index].ratingByName,
                          controller.rateReviewsRestaurantList[index].rating,
                          controller.rateReviewsRestaurantList[index].reviews,
                        );
                      },
                    ),
                  ),
                ],
              )
            : const CommonNoDataFound();
      },
    );
  }

  reviewsWidget(profilePic, ratingByName, rating, reviews) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 39,
              height: 39,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:
                        // profilePic
                        //     ??
                        AssetImage(
                      "assets/images/home/profile_image.png",
                    ),
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: ratingByName ?? "Roger",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: black0D0000,
                ),
                const SizedBox(
                  height: 8,
                ),
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  //itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        SizedBox(
          width: Get.width - 30,
          child: CommonText(
            text: reviews ??
                " It’s a great experience. The ambiance is very welcoming and charming. Amazing wines, food and service. Staff are extremely knowledgeable and make great recommendations.",
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: textDark3F3E3E,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
