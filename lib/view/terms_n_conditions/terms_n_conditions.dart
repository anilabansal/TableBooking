import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';

class TermsNConditionsView extends StatelessWidget {
  const TermsNConditionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            CommonText(
              text: 'Terms & Conditions',
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            CommonSizedBox(
              height: 20,
            ),
            CommonText(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium, dui sed pharetra congue, leo ipsum tincidunt nulla, a posuere lectus nulla lobortis metus. Mauris non efficitur ipsum. Phasellus et sollicitudin sapien. Donec malesuada est nisi, eget viverra mauris pulvinar commodo.',
            ),
            CommonSizedBox(
              height: 20,
            ),
            CommonText(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium, dui sed pharetra congue, leo ipsum tincidunt nulla, a posuere lectus nulla lobortis metus. Mauris non efficitur ipsum. Phasellus et sollicitudin sapien. Donec malesuada est nisi, eget viverra mauris pulvinar commodo.',
            ),
            CommonText(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium, dui sed pharetra congue, leo ipsum tincidunt nulla, a posuere lectus nulla lobortis metus. Mauris non efficitur ipsum. Phasellus et sollicitudin sapien. Donec malesuada est nisi, eget viverra mauris pulvinar commodo.',
            ),
          ],
        ),
      ),
    );
  }
}
