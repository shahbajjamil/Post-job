import 'package:flutter/material.dart';

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context,
    {double multiplyBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).height - reducedBy) * multiplyBy;
}

double screenWidth(BuildContext context,
    {double multiplyBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).width - reducedBy) * multiplyBy;
}
