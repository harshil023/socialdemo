import 'package:flutter/material.dart';
import 'package:socialdemo/style/color_constants.dart';

class ButtonStyles {
  static ButtonStyle redButtonStyle({
    Color backgroundColor = ColorConstants.red,
    Color foregroundColor = ColorConstants.red,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    double elevation = 4.0,
  }) {
    return ElevatedButton.styleFrom(
     backgroundColor: backgroundColor,
      padding: padding,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
    );
  }
  static ButtonStyle whiteButtonRedBorderStyle({
    Color backgroundColor = ColorConstants.white,
    Color foregroundColor = ColorConstants.white,
    Color borderColor = ColorConstants.red,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    double elevation = 4.0,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: padding,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
          side: BorderSide(color: borderColor, width: 2)
      ),
    );
  }
  static ButtonStyle greyButtonStyle({
    Color backgroundColor = ColorConstants.grayA5,
    Color foregroundColor = ColorConstants.grayA5,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    double elevation = 4.0,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: padding,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
    );
  }
  static ButtonStyle whiteButtonBlackBorder({
    Color backgroundColor = ColorConstants.white,
    Color foregroundColor = ColorConstants.white,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    double elevation = 4.0,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
        side: BorderSide(
          color: Colors.black, // Set the border color to black
          width: 1, // Set the border width (adjust as needed)
        ),
      ),
    );
  }

}