import 'package:flutter/material.dart';
import 'dart:ui';

double widths = window.physicalSize.width / window.devicePixelRatio;
double heights = window.physicalSize.height / window.devicePixelRatio;

double getWidth(double px) {
  return px * (widths / 360);
}

double getFontSize(double px) {
  return (widths / 360) > 1.5 ? px * 1.5 : px * (widths / 360);
}

double getHeight(double px) {
  return px * (heights / 759);
}
