import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/common/widgets_methods/common_textformfield.dart';
import 'package:flutter/material.dart';

class AddCardDetailsRowThree extends StatelessWidget {
  const AddCardDetailsRowThree({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CommonText(
                text: 'Card Holder Name',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                // fontFamily: mainLatoFont,
              ),
              CommonSizedBox(
                height: 6,
              ),
              CommonTextFormField(
                hintText: 'DD/MM',
                // suffixIcon: const Icon(Icons.arrow_drop_down),
                filled: true,
                fillColor: whiteF4F4F4,
              ),
              CommonSizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        CommonSizedBox(
          width: 32,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonText(
                text: 'Cvv',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                // fontFamily: mainLatoFont,
              ),
              CommonSizedBox(
                height: 6,
              ),
              CommonTextFormField(
                hintText: '***',
                maxLength: 3,
                keyboardType: TextInputType.number,
                obscureText: true,
                filled: true,
                fillColor: whiteF4F4F4,
              ),
              CommonSizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AddCardDetailsRowTwo extends StatelessWidget {
  const AddCardDetailsRowTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Credit Card Number',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          // fontFamily: mainLatoFont,
        ),
        CommonSizedBox(
          height: 6,
        ),
        CommonTextFormField(
          hintText: 'Exp. Date',
          filled: true,
          fillColor: whiteF4F4F4,
        ),
        CommonSizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class AddCardDetailsRowOne extends StatelessWidget {
  const AddCardDetailsRowOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: 'Card Holder Name',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          // fontFamily: mainLatoFont,
        ),
        CommonSizedBox(
          height: 6,
        ),
        CommonTextFormField(
          hintText: 'Enter card holder name',
          filled: true,
          fillColor: whiteF4F4F4,
        ),
        CommonSizedBox(
          height: 20,
        ),
      ],
    );
  }
}
