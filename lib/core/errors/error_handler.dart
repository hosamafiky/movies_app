import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import 'failures.dart';

class ErrorHandler {
  const ErrorHandler._();

  static String getErrorMessage(Failure failure) {
    if (failure is NoInternetConnectionFailure) {
      return AppStrings.noInternetConnection;
    }

    final response = failure.response;
    if (response.message.isNotEmpty) {
      return response.message;
    }

    return AppStrings.errorOccurred;
  }

  static void showErrorSnackBar(BuildContext context, {required Failure failure}) {
    final message = getErrorMessage(failure);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.redAccent, behavior: SnackBarBehavior.floating));
  }
}
