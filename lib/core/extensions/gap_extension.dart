import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension GapSizedBox on Widget{

  static SizedBox get tinyGap =>  SizedBox(height: 1.h);
  static SizedBox get miniGap =>  SizedBox(height: 2.h);
  static SizedBox get smallGap =>  SizedBox(height: 4.h);
  static SizedBox get mediumGap =>  SizedBox(height: 8.h,);
  static SizedBox get highGap =>  SizedBox(height: 12.h,);
  static SizedBox get hugeGap =>  SizedBox(height: 60.h,);

  static SizedBox get miniGapW =>  SizedBox(width: 2.w);
  static SizedBox get smallGapW =>  SizedBox(width: 4.w);
  static SizedBox get mediumGapW =>  SizedBox(width: 8.w,);
  static SizedBox get highGapW =>  SizedBox(width: 12.w,);
}