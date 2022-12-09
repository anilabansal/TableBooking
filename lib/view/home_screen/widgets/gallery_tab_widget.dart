// ignore_for_file: must_be_immutable
import 'dart:ui';
import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/no_data_found.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../restaurant_image_zoom_view.dart';

class GalleryTab extends StatefulWidget {
  final int? restaurantId;
  const GalleryTab({Key? key, this.restaurantId}) : super(key: key);
  @override
  State<GalleryTab> createState() => _GalleryTabState();
}
class _GalleryTabState extends State<GalleryTab> {
  RestaurantDetailsController restaurantsController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    loadAllGallery();
    super.initState();
  }

  loadAllGallery() {
    restaurantsController.isLoading.value = true;
    restaurantsController.restaurantDetailsGalleryImages(
        body: {"RestaurantId": widget.restaurantId}).then((value) {
      if (value) {
        restaurantsController.isLoading.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDetailsController>(
      builder: (controller) {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                color: redE2211C,
              ))
            :
            // controller.galleryImagesRestaurantList.value != null
            //   ?
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: "All Photos",
                    fontWeight: FontWeight.w700,
                    color: black000000,
                    fontSize: 15,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Expanded(
                    child: controller.galleryImagesRestaurantList.isEmpty
                        ? const CommonNoDataFound()
                        : StaggeredGridView.countBuilder(
                            crossAxisCount: 4,
                            shrinkWrap: true,
                            mainAxisSpacing: 17,
                            crossAxisSpacing: 17,
                            //  physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                controller.galleryImagesRestaurantList.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 2, sigmaY: 2),
                                          child: AlertDialog(
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            content: SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: RestaurantImageZoomView(
                                                restaurantImage: controller
                                                    .galleryImagesRestaurantList[
                                                        index]
                                                    .restaurantImage,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Image.network(
                                      controller
                                          .galleryImagesRestaurantList[index]
                                          .restaurantImage,
                                    )),
                              );
                            },
                            staggeredTileBuilder: (int index) =>
                                StaggeredTile.count(2, index.isEven ? 2 : 2.5),
                          ),
                  )
                ],
              );
        // : const CommonNoDataFound();
      },
    );
  }
}
