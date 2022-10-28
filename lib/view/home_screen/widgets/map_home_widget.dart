import 'package:flutter/material.dart';

import '../../../utils/common/images_string.dart';

class MapHomeScreen extends StatelessWidget {
  const MapHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 628,
      child:Image.asset(mapImage),
    );
  }
}
