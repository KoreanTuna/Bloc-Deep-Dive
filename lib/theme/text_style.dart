import 'package:bloc_deep_dive/theme/color_style.dart';
import 'package:flutter/material.dart';

const String pretendardFontFamily = 'Pretendard';
const String jalnanFontFamily = 'Jalnan';
const String jalnanGothicFontFamily = 'JalnanGothic';

extension EmotionBarnTextStyle on TextStyle {
  TextStyle get title1 => copyWith(
    fontSize: 32,
    fontFamily: jalnanFontFamily,
    height: 1.2,
    letterSpacing: 0,
    color: ColorStyle.gray850,
  );

  TextStyle get title2 => copyWith(
    fontSize: 24,
    fontFamily: jalnanFontFamily,
    height: 1.2,
    letterSpacing: 0,
    color: ColorStyle.gray850,
  );

  TextStyle get title3 => copyWith(
    fontSize: 20,
    fontFamily: jalnanFontFamily,
    height: 1.2,
    letterSpacing: 0,
    color: ColorStyle.gray850,
  );

  TextStyle get subTitle1 => copyWith(
    fontSize: 20,
    fontFamily: jalnanFontFamily,
    height: 1.2,
    letterSpacing: 0,
    color: ColorStyle.gray850,
    fontVariations: const <FontVariation>[FontVariation('wght', 700)],
  );

  TextStyle get subTitle2 => copyWith(
    fontSize: 18,
    fontFamily: jalnanFontFamily,
    height: 1.2,
    letterSpacing: 0,
    color: ColorStyle.gray850,
    fontVariations: const <FontVariation>[FontVariation('wght', 700)],
  );

  TextStyle get subTitle3 => copyWith(
    fontSize: 16,
    fontFamily: jalnanFontFamily,
    height: 1.2,
    letterSpacing: 0,
    color: ColorStyle.gray850,
    fontVariations: const <FontVariation>[FontVariation('wght', 700)],
  );

  TextStyle get body1 => copyWith(
    fontSize: 16,
    fontFamily: pretendardFontFamily,
    height: 1.4,
    letterSpacing: 0,
    color: ColorStyle.gray850,
    fontVariations: const <FontVariation>[FontVariation('wght', 500)],
  );

  TextStyle get body2 => copyWith(
    fontSize: 14,
    fontFamily: pretendardFontFamily,
    height: 1.4,
    letterSpacing: 0,
    color: ColorStyle.gray850,
    fontVariations: const <FontVariation>[FontVariation('wght', 500)],
  );

  TextStyle get detail => copyWith(
    fontSize: 12,
    fontFamily: pretendardFontFamily,
    height: 1.4,
    letterSpacing: 0,
    color: ColorStyle.gray850,
    fontVariations: const <FontVariation>[FontVariation('wght', 500)],
  );
}
