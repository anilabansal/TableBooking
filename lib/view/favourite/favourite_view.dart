import 'package:booking_table/utils/common/images_string.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(
        text: 'Favorites',
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 35,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 15),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 11,
                  right: 11,
                ),
                // color: whiteE5E5E5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CommonSizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 133,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                bookATableImage,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          width: 33,
                          height: 33,
                          right: 30,
                          bottom: 00,
                          child: Container(
                            height: 33,
                            width: 33,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              // image: DecorationImage(
                              //   image: AssetImage(heartLogo),
                              //   fit: BoxFit.fill,
                              // ),
                            ),
                            child: Image.asset(
                              heartLogo,
                              height: 19,
                              width: 17,
                            ),
                          ),
                        )
                      ],
                    ),
                    CommonSizedBox(
                      height: 15,
                    ),
                    CommonText(
                      text: 'Denies Jazz House',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    CommonSizedBox(
                      height: 5,
                    ),
                    CommonText(
                      text: '1 miles away',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    CommonSizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
