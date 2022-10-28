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
            const SizedBox(height: 65),
            const Text(
              'Image',
            ),
            CommonText(
              text: 'Welcome',
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            CommonText(
              text: 'Claire Fiona',
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                alignment: Alignment.center,
                child: CommonText(
                  text: 'Enter your location to find restaurants in your area.',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
