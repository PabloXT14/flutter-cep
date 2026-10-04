import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles._() {
  static TextStyle get headingLg => GoogleFonts.nunito(
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get headingMd => GoogleFonts.nunito(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get headingSm => GoogleFonts.nunito(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get headingXs => GoogleFonts.nunito(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get bodyLg => GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get bodyLgSemibold => GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get bodyMd => GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get bodySm => GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get bodyXs => GoogleFonts.nunito(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get caption => GoogleFonts.nunito(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get label => GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
