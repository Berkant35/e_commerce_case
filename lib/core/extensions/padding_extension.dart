import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension PaddingExtension on EdgeInsets {
  // Padding
  EdgeInsets get paddingLow =>  EdgeInsets.all(8.px);
  EdgeInsets get paddingNormal =>  EdgeInsets.all(15.px);
  EdgeInsets get paddingMedium =>  EdgeInsets.all(22.px);
  EdgeInsets get paddingHigh =>  EdgeInsets.all(36.px);
  EdgeInsets get paddingHuge =>  EdgeInsets.all(40.px);
  // Horizontal Padding;
  EdgeInsets get paddingLowW =>  EdgeInsets.symmetric(horizontal: 8.w);
  EdgeInsets get paddingNormalW =>  EdgeInsets.symmetric(horizontal: 15.w);
  EdgeInsets get paddingMediumW =>  EdgeInsets.symmetric(horizontal: 22.w);
  EdgeInsets get paddingHighW =>  EdgeInsets.symmetric(horizontal: 36.w);
  EdgeInsets get paddingHugeW =>  EdgeInsets.symmetric(horizontal: 40.w);
  // Vertical Padding
  EdgeInsets get paddingLowH =>  EdgeInsets.symmetric(vertical: 8.h);
  EdgeInsets get paddingNormalH =>  EdgeInsets.symmetric(vertical: 15.h);
  EdgeInsets get paddingMediumH =>  EdgeInsets.symmetric(vertical: 22.h);
  EdgeInsets get paddingHighH =>  EdgeInsets.symmetric(vertical: 36.h);
  EdgeInsets get paddingHugeH =>  EdgeInsets.symmetric(vertical: 40.h);
  // Vertical and Horizontal Padding
  EdgeInsets get paddingLowVH =>  EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w);
  EdgeInsets get paddingNormalVH =>  EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w);
  EdgeInsets get paddingMediumVH =>  EdgeInsets.symmetric(vertical: 22.h, horizontal: 22.w);
  EdgeInsets get paddingHighVH =>  EdgeInsets.symmetric(vertical: 36.h, horizontal: 36.w);
  EdgeInsets get paddingHugeVH =>  EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w);
}