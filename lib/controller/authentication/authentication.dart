import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  static final AuthenticationController _authenticationController =
      AuthenticationController._internal();

  factory AuthenticationController() {
    return _authenticationController;
  }

  AuthenticationController._internal();
}
