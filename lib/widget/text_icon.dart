import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    Key? key,
    required this.title,
    this.color,
    required this.iconData,
    this.iconSize,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final double? iconSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: color ?? AppColors.grey,
          size: iconSize,
        ),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            title,
            overflow: TextOverflow.clip,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
