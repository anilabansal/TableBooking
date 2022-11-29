import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
        child: GooglePlaceAutoCompleteTextField(
          textEditingController: widget.destinationController!,
          // textEditingController: locationController.searchController.value,
          googleAPIKey: googleApiKey,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: black000000,
          ),
          inputDecoration: InputDecoration(
            hintText: widget.hintText.toString(),
            border: InputBorder.none,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: black000000,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                widget.destinationController!.clear();
              },
              icon: const Icon(
                Icons.close,
                //color: white,
              ),
            ),
          ),
          itmClick: (Prediction prediction) {
            print('onTap');
            widget.destinationController!.text = prediction.description.toString();
            widget.callBack!();
          },
        ),
      ),
    );
  }
}
