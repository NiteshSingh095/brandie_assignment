import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimens {
  const Dimens._();

  /// Get the height with the percent value of the screen height.
  static double percentHeight(double percentValue) => percentValue.sh;

  /// Get the width with the percent value of the screen width.
  static double percentWidth(double percentValue) => percentValue.sw;

  static double get appBarHeight => fiftySix;

  static double get appBarElevation => eight;

  static double get pinCodeField => fortyEight;

  static double get investTypeSized => oneHundredSixty;

  static double get pointFive => 0.5.sp;
  static double get zero => 0.sp;
  static double get one => 1.sp;
  static double get two => 2.sp;
  static double get three => 3.sp;
  static double get four => 4.sp;
  static double get five => 5.sp;
  static double get six => 6.sp;
  static double get seven => 7.sp;
  static double get eight => 8.sp;
  static double get ten => 10.sp;
  static double get twelve => 12.sp;
  static double get thirteen => 13.sp;
  static double get fourteen => 14.sp;
  static double get fifteen => 15.sp;
  static double get sixteen => 16.sp;
  static double get seventeen => 17.sp;
  static double get eighteen => 18.sp;
  static double get twenty => 20.sp;
  static double get twentyTwo => 22.sp;
  static double get twentyThree => 23.sp;
  static double get twentyFour => 24.sp;
  static double get twentyFive => 25.sp;
  static double get twentySix => 26.sp;
  static double get twentyEight => 28.sp;
  static double get thirty => 30.sp;
  static double get thirtyTwo => 32.sp;
  static double get thirtyFive => 35.sp;
  static double get thirtySix => 36.sp;
  static double get thirtySeven => 37.sp;
  static double get thirtyEight => 38.sp;
  static double get forty => 40.sp;
  static double get fortyTwo => 42.sp;
  static double get fortyFour => 44.sp;
  static double get fortyFive => 45.sp;
  static double get fortySeven => 47.sp;
  static double get fortyEight => 48.sp;
  static double get fourtyNine => 49.sp;
  static double get fifty => 50.sp;
  static double get fiftyFour => 54.sp;
  static double get fiftySix => 56.sp;
  static double get sixty => 60.sp;
  static double get sixtyFour => 64.sp;
  static double get sixtyEight => 68.sp;
  static double get seventy => 70.sp;
  static double get seventyTwo => 72.sp;
  static double get seventySix => 76.sp;
  static double get eighty => 80.sp;
  static double get eightySix => 86.sp;
  static double get ninety => 90.sp;
  static double get ninetyTwo => 92.sp;
  static double get ninetySix => 96.sp;
  static double get hundred => 100.sp;
  static double get oneHundredTen => 110.sp;
  static double get oneHundredTwenty => 120.sp;
  static double get oneHundredTwentyFive => 125.sp;
  static double get oneHundredThirty => 130.sp;
  static double get oneHundredFourty => 140.sp;
  static double get oneHundredFifty => 150.sp;
  static double get oneHundredFiftySix => 156.sp;
  static double get oneHundredSixty => 160.sp;
  static double get oneHundredSeventy => 170.sp;
  static double get oneHundredEighty => 180.sp;
  static double get oneHundredNinty => 190.sp;
  static double get oneSeventyThree => 173.sp;
  static double get twoHundred => 200.sp;
  static double get twoHundredTwenty => 220.sp;
  static double get twoHundredThirtyFive => 235.sp;
  static double get twoHundredFifty => 250.sp;
  static double get twoHundredSeventyFive => 275.sp;
  static double get threeHundred => 300.sp;
  static double get threeHundredThirty => 330.sp;
  static double get threeHundredSeventyFive => 375.sp;
  static double get threeHundredNinetySix => 396.sp;
  static double get fourHundred => 400.sp;
  static double get fourHundredFifty => 450.sp;
  static double get fiveHundred => 500.sp;
  static double get fiveHundredTwentyEight => 528.sp;
  static double get fiveHundredThirty => 530.sp;
  static double get fiveHundredFifty => 550.sp;
  static double get fiveHundredSeventyFive => 575.sp;
  static double get sixHundred => 600.sp;
  static double get sevenHundred => 700.sp;
  static double get sevenHundredTwenty => 720.sp;
  static double get eightHundred => 800.sp;

  /// Returns Box with requested height value
  static SizedBox boxHeight(double height) =>
      height == 0 ? const SizedBox.shrink() : SizedBox(height: height);

  /// Returns Box with requested width value
  static SizedBox boxWidth(double width) => SizedBox(width: width);

  static EdgeInsets edgeInsets({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) =>
      EdgeInsets.fromLTRB(
        left ?? zero,
        top ?? zero,
        right ?? zero,
        bottom ?? zero,
      );

  static EdgeInsets edgeInsetsAll(double allSide) => EdgeInsets.all(allSide);

  static EdgeInsets edgeInsetsSymmetric({
    double? vertical,
    double? horizontal,
  }) =>
      EdgeInsets.symmetric(
        vertical: vertical ?? 0,
        horizontal: horizontal ?? 0,
      );
}
