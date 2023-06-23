import '../../../widgets/gapper.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class ClickableIcon extends StatelessWidget {
  final String iconName, iconImagePath;
  final void Function()? onTap;

  const ClickableIcon({
    super.key,
    required this.iconName,
    required this.iconImagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.documentSettingsOptionGreyColor,
            child: Image.asset(iconImagePath),
          ),
          const VerticalGap(),
          Text(
            iconName,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
