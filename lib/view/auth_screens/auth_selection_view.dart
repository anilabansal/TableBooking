import 'package:booking_table/view/auth_screens/widgets/auth_selection_body.dart';
import 'package:flutter/material.dart';

class AuthSelectionView extends StatelessWidget {
  const AuthSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthSelectionBody(),
    );
  }
}
