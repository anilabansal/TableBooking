import 'package:booking_table/utils/common/images_string.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';

class GetZipCodeView extends StatelessWidget {
  const GetZipCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonSizedBox(height: 65),
            CommonSizedBox(
              height: 93,
              width: 93,
              child: Container(
                decoration: const BoxDecoration(),
                child: Image.asset(zipcodeUserImage),
              ),
            ),
            CommonSizedBox(
              height: 33,
            ),
            CommonText(
              text: 'Welcome',
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            CommonSizedBox(
              height: 7,
            ),
            CommonText(
              text: 'Claire Fiona',
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            CommonSizedBox(
              height: 18,
            ),
            CommonText(
              textAlign: TextAlign.center,
              text: 'Enter your location to find restaurants\n in your area.',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            CommonSizedBox(
              height: 35,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Location',
                  suffixIcon: Icon(
                    Icons.place,
                    color: Colors.black,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            CommonSizedBox(
              height: 25,
            ),
            CommonSizedBox(
              height: 50,
              width: 184,
              child: CommonButton(
                text: 'Search',
                bgColor: Colors.red,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
