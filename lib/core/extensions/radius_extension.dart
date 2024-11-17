


import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension BordeRadiusExtension on BuildContext{
  BorderRadius get radiusTiny => BorderRadius.circular(4.px);
  BorderRadius get radiusLow => BorderRadius.circular(8.px);
  BorderRadius get radiusNormal => BorderRadius.circular(15.px);
  BorderRadius get radiusMedium => BorderRadius.circular(22.px);
  BorderRadius get radiusHigh => BorderRadius.circular(36.px);
  BorderRadius get radiusHuge => BorderRadius.circular(40.px);
  BorderRadius get radiusCustom => BorderRadius.circular(50.px);
}