import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showCustomSnackBar(
    {required BuildContext context,
    required String text,
    required bool status}) {
  if (status == true) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: text,
      ),
    );
  } else {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: text,
      ),
    );
  }
}
