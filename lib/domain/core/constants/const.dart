import 'package:flutter/material.dart';
late double sWidth;
void sizeFinder(BuildContext context) {
  final size = MediaQuery.of(context).size;
  sWidth = size.width;
}