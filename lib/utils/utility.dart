import 'dart:developer' as dev;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../style/color_constants.dart';
import '../style/dimensions.dart';
import 'app_constants.dart';

void printf(dynamic value) {
  if (!kReleaseMode) dev.log(value.toString());
}

class Utility {
  static bool isShowing = false;

  static bool isEmpty(String? string) {
    return string == null || string.length == 0;
  }

  static Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      print("Connected to the internet");
      return true;
    }
    print("Not connected to the internet");
    return false;
  }

  static Widget? hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    return null;
  }



  static snackBar(String msg, BuildContext context) {
    var snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showLongToast(
    var message,
  ) {
    if (message.isNotEmpty && kDebugMode) {
      return Fluttertoast.showToast(
          msg: message, toastLength: Toast.LENGTH_LONG);
    }
  }

  static showShortToast({
    required var message,
  }) {
    if (message.isNotEmpty && kDebugMode) {
      return Fluttertoast.showToast(
          msg: message, toastLength: Toast.LENGTH_SHORT);
    }
  }

  static Widget buildProgressIndicator() {
    return Container(
      height: Dimensions.screenHeight,
      color: ColorConstants.black.withOpacity(0.4),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: ColorConstants.blue,
          valueColor: new AlwaysStoppedAnimation<Color>(ColorConstants.white),
        ),
      ),
    );
  }

  static void showProgressDialog(BuildContext context, {from}) {
    isShowing = true;
    showDialog(
        barrierDismissible: false,
        useSafeArea: true,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static void hideProgressDialog(BuildContext context) {
    if (isShowing) {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      isShowing = false;
    }
  }

  static bool isValidMobileNumber(String? number) {
    if (isEmpty(number)) {
      return false;
    }

    final mobileNumber = number!.trim();

    // Check if number contains only digits and has the right length
    return RegExp(r'^\d{10}$').hasMatch(mobileNumber);
  }

  static void logLongText(String text) {
    const int chunkSize =
        800; // Set chunk size (800 characters is a safe bet for log)
    int startIndex = 0;
    while (startIndex < text.length) {
      int endIndex = startIndex + chunkSize;
      if (endIndex > text.length) {
        endIndex = text.length;
      }
      debugPrint(text.substring(startIndex, endIndex));
      startIndex = endIndex;
    }
  }
  static String convertTimestamptoDate(var timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp!.toInt());

    // Format DateTime to DDMMYY format
    String formattedDate = DateFormat('dd-MM-yy').format(dateTime);

    return formattedDate;
  }
}
