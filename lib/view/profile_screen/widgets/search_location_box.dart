import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import '../../../controller/location/location_controller.dart';
import '../../../utils/common/common_strings.dart';

class SearchBox extends StatefulWidget {
  final String? hintText;
  final Function()? callBack;
  final TextEditingController? destinationController;
  const SearchBox(
      {Key? key, this.hintText, this.callBack, this.destinationController})
      : super(key: key);
  @override
  State<SearchBox> createState() => _SearchBoxState();
}
class _SearchBoxState extends State<SearchBox> {
  var googleApiKey = "AIzaSyBLVQD5gh9CP8C4_yrzuhvn06ZfhfFUODE";
  LocationController locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        // boxShadow: const [
        //   BoxShadow(
        //     color: Colors.white,
        //     blurRadius: 6,
        //     offset: Offset(0, 5),
        //   ),
        //   BoxShadow(
        //     color: Colors.white,
        //     blurRadius: 5,
        //     offset: Offset(5, 0),
        //   ),
        // ],
      ),
      child: PlacesAutocompleteFormField(
        types: const [],
        strictbounds: false,
        apiKey: googleApiKey,
        mode: Mode.overlay,
        language: "en",
        inputDecoration: const InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: black000000,
          ),
        ),
        hint: widget.hintText.toString(),
        controller: widget.destinationController,
        onSaved: (data) {
          print('Staring data -------------------------> $data');
        },
        components: const [],
        trailing: const Icon(Icons.arrow_forward_outlined),
        trailingOnTap: () {
          widget.callBack!();
        },
      ),
    );
  }
}
