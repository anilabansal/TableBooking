import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/authentication/register_controller.dart';

// PRIVACY POLICY & TERMS N CONDITIONS
 privacyPolicyNTerms() {
  return Obx(() => Column(
    children: <Widget>[
      CommonSizedBox(height: 58),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 18,
            height: 18,
            child: Checkbox(
              value: Get.find<RegisterController>().termCheck.value,
              onChanged: (value) {
                Get.find<RegisterController>().termCheck.value = value!;
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              ),
              side: MaterialStateBorderSide.resolveWith(
                    (states) =>
                const BorderSide(width: 1.0, color: redE2211C),
              ),
              fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    // if (states.contains(MaterialState.disabled)) {
                    //   return Colors.red;
                    // }
                    //     if()
                    return Colors.red;
                  }),
            ),
          ),
          const SizedBox(width: 13,),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                      text: 'I agree with all ',
                      style: TextStyle(color: textDark3F3E3E, fontSize: 14)),
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: const TextStyle(
                      color: black040404,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO : TERMS & CONDITIONS
                        Get.toNamed('/terms-and-conditions');
                      },
                  ),
                  const TextSpan(
                      text: ' and ',
                      style: TextStyle(
                        color: textDark3F3E3E,
                        fontSize: 14,
                      )),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: const TextStyle(
                      color: black040404,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO : PRIVACY POLICY
                        Get.toNamed('/privacy-policy');
                      },
                  ),
                  const TextSpan(
                    text: '.',
                    style: TextStyle(
                      color: textDark3F3E3E,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      CommonSizedBox(height: 15),
    ],
  ));
}
