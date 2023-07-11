import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_screeens/core/design/decoration/base_color.dart';

class BaseTextStyle {

  static TextStyle blackH1() {
    return GoogleFonts.poppins(
      color: BaseColors.black,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle blackH2() {
    return GoogleFonts.poppins(
      color: BaseColors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle blackH3() {
    return GoogleFonts.poppins(
      color: BaseColors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle blackH5() {
    return GoogleFonts.poppins(
      color: BaseColors.black,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle grayTitle() {
    return GoogleFonts.poppins(
      color: BaseColors.grey,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle grayInput() {
    return GoogleFonts.poppins(
      color: BaseColors.grey.withOpacity(0.36),
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle whiteRegular() {
    return GoogleFonts.poppins(
      color: BaseColors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }
}
