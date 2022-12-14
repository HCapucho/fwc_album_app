import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Poppins';
  String get secondaryFont => 'MPlus1P';

  // Primary font
  TextStyle get textPrimaryFontRegular =>
      TextStyle(fontFamily: primaryFont, fontWeight: FontWeight.normal);
  TextStyle get textPrimaryFontMedium =>
      TextStyle(fontFamily: primaryFont, fontWeight: FontWeight.w500);
  TextStyle get textPrimaryFontSemiBold =>
      TextStyle(fontFamily: primaryFont, fontWeight: FontWeight.w600);
  TextStyle get textPrimaryFontBold =>
      TextStyle(fontFamily: primaryFont, fontWeight: FontWeight.bold);
  TextStyle get textPrimaryFontExtraBold =>
      TextStyle(fontFamily: primaryFont, fontWeight: FontWeight.w800);

  // Secondary font
  TextStyle get textSecondaryFontRegular =>
      TextStyle(fontFamily: secondaryFont, fontWeight: FontWeight.normal);
  TextStyle get textSecondaryFontMedium =>
      TextStyle(fontFamily: secondaryFont, fontWeight: FontWeight.w600);
  TextStyle get textSecondaryFontBold =>
      TextStyle(fontFamily: secondaryFont, fontWeight: FontWeight.bold);
  TextStyle get textSecondaryFontExtraBold =>
      TextStyle(fontFamily: secondaryFont, fontWeight: FontWeight.w800);

  TextStyle get labelTextField =>
      textSecondaryFontRegular.copyWith(color: ColorsApp.i.greyDark);

  TextStyle get textSecondaryFontExtraBoldPrimaryColor =>
      textSecondaryFontExtraBold.copyWith(color: ColorsApp.i.primary);

  TextStyle get titleWhite =>
      textPrimaryFontBold.copyWith(color: Colors.white, fontSize: 22);
  TextStyle get titleBlack =>
      textPrimaryFontBold.copyWith(color: Colors.black, fontSize: 22);
  TextStyle get titlePrimaryColor =>
      textPrimaryFontBold.copyWith(color: ColorsApp.i.primary, fontSize: 22);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
