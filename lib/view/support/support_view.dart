import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import '../../controller/support/customer_support_controller.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/common/widgets_methods/common_button.dart';
import '../../utils/common/widgets_methods/common_sized_box.dart';
import '../../utils/common/widgets_methods/common_text.dart';
import '../../utils/common/widgets_methods/common_text_form_field.dart';

class SupportView extends StatelessWidget {
   SupportView({Key? key}) : super(key: key);
   SupportController supportController = Get.find();
var emailTextController = TextEditingController();
var topicController = TextEditingController();
var commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appBarCommon(
        text: 'Support',
      ),
      // body: const SingleChildScrollView(
      //   child: SupportBody(),
      // ),
       body: SingleChildScrollView(
         child: Center(
           child: Column(
             children: <Widget>[
               CommonSizedBox(
                 height: 20,
               ),
               Image.asset(
                 supportIcon,
                 height: 139,
                 width: 132,
               ),
               CommonSizedBox(
                 height: 30,
               ),
               CommonText(
                 textAlign: TextAlign.center,
                 fontSize: 16,
                 fontWeight: FontWeight.w500,
                 text: 'We will respond as quickly as possible\n to all inquiries',
               ),
               CommonSizedBox(
                 height: 30,
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     CommonText(
                       text: 'Email',
                       fontSize: 14,
                       textAlign: TextAlign.left,
                       fontWeight: FontWeight.w400,
                     ),
                     const SizedBox(
                       height: 5,
                     ),
                     CommonTextFormField(
                       filled: true,
                       fillColor: whiteF4F4F4,
                       hintText: 'Enter Email',
                       controller: emailTextController,
                       keyboardType: TextInputType.emailAddress,
                     ),
                     CommonSizedBox(
                       height: 25,
                     ),
                     CommonText(
                       text: 'Topic',
                       fontSize: 14,
                       textAlign: TextAlign.left,
                       fontWeight: FontWeight.w400,
                     ),
                     const SizedBox(
                       height: 5,
                     ),
                     CommonTextFormField(
                       filled: true,
                       fillColor: whiteF4F4F4,
                       hintText: 'Enter Topic',
                       controller: topicController,
                     ),
                     CommonSizedBox(
                       height: 25,
                     ),
                     CommonText(
                       text: 'Comment',
                       fontSize: 14,
                       textAlign: TextAlign.left,
                       fontWeight: FontWeight.w400,
                     ),
                     const SizedBox(
                       height: 5,
                     ),
                     CommonTextFormField(
                       filled: true,
                       fillColor: whiteF4F4F4,
                       hintText: 'Type Here...',
                       maxLines: 5,
                       controller: commentController,
                      // keyboardType: TextInputType.,
                     ),
                     CommonSizedBox(
                       height: 25,
                     ),
                     CommonButton(
                       text: 'Submit',
                       fontSize: 18,
                       bgColor: redE2211C,
                       textColor: Colors.white,
                       // onTap: (){
                       //   if (validation() != '') {
                       //     ShowToast.show(
                       //       msg: validation(),
                       //       isError: true,
                       //     );
                       //     return false;
                       //   }
                       //   else{
                       //     supportController.contactUstApiCall(
                       //       body: {
                       //         "Email":emailTextController.text.trim(),
                       //         "Topic":topicController.text.trim(),
                       //         "Comment":commentController.text.trim()
                       //       }
                       //     ).then((value) {
                       //       if(value){
                       //
                       //       }
                       //     }
                       //     );
                       //   }
                       // },
                     ),
                     CommonSizedBox(
                       height: 20,
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
    );
  }
  validation(){
    if(!GetUtils.isEmail(emailTextController.value.text.trim())){
      return 'please enter valid email!'.toTitleCase();
    }
    else if(topicController.text.trim().isEmpty){
      return 'please enter topic!'.toTitleCase();
    }
    else if(commentController.text.trim().isEmpty){
      return 'please enter comments!'.toTitleCase();
    }
    else{
      return '';
    }
  }
}
